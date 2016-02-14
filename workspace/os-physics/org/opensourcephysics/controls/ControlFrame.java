/*
 * Open Source Physics software is free software as described near the bottom of this code file.
 *
 * For additional information and documentation on Open Source Physics please see:
 * <http://www.opensourcephysics.org/>
 */

package org.opensourcephysics.controls;
import java.io.*;
import java.awt.*;
import java.awt.datatransfer.*;
import java.awt.event.*;
import javax.swing.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.tools.FontSizer;
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;
import org.opensourcephysics.tools.ToolsRes;

/**
 *  A frame with menu items for saving and loading control parameters
 *
 * @author       Wolfgang Christian
 * @version 1.0
 */
abstract public class ControlFrame extends OSPFrame implements Control {
   final static int MENU_SHORTCUT_KEY_MASK = Toolkit.getDefaultToolkit().getMenuShortcutKeyMask();
   protected Object model; // the object that will be controlled
   protected JMenuItem[] languageItems;
   protected JMenu languageMenu;
   protected JMenu fileMenu;
   protected JMenu editMenu;
   protected JMenu displayMenu;
   protected JMenuItem readItem, clearItem;
   protected JMenuItem saveAsItem;
   protected JMenuItem copyItem;
   protected JMenuItem inspectItem;
   protected JMenuItem logToFileItem;
   protected JMenuItem sizeUpItem;
   protected JMenuItem sizeDownItem;
   protected OSPApplication ospApp;
   protected XMLControlElement xmlDefault;
   protected ControlFrame(String title) {
      super(title);
      createMenuBar();
      setName("controlFrame"); //$NON-NLS-1$
   }

   private void createMenuBar() {
      JMenuBar menuBar = new JMenuBar();
      if(!OSPFrame.appletMode) {
         setJMenuBar(menuBar);
      }
      fileMenu = new JMenu(ControlsRes.getString("ControlFrame.File")); //$NON-NLS-1$
      editMenu = new JMenu(ControlsRes.getString("ControlFrame.Edit")); //$NON-NLS-1$
      menuBar.add(fileMenu);
      menuBar.add(editMenu);
      readItem = new JMenuItem(ControlsRes.getString("ControlFrame.Load_XML")); //$NON-NLS-1$
      saveAsItem = new JMenuItem(ControlsRes.getString("ControlFrame.Save_XML")); //$NON-NLS-1$
      inspectItem = new JMenuItem(ControlsRes.getString("ControlFrame.Inspect_XML")); //$NON-NLS-1$
      clearItem = new JMenuItem(ControlsRes.getString("ControlFrame.Clear_XML")); //$NON-NLS-1$
      copyItem = new JMenuItem(ControlsRes.getString("ControlFrame.Copy")); //$NON-NLS-1$
      fileMenu.add(readItem);
      fileMenu.add(saveAsItem);
      fileMenu.add(inspectItem);
      fileMenu.add(clearItem);
      editMenu.add(copyItem);
      copyItem.setAccelerator(KeyStroke.getKeyStroke('C', MENU_SHORTCUT_KEY_MASK));
      copyItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            copy();
         }
      });
      saveAsItem.setAccelerator(KeyStroke.getKeyStroke('S', MENU_SHORTCUT_KEY_MASK));
      saveAsItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            // save(); // cannot use a static method here because of run-time binding
            saveXML();
         }
      });
      inspectItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            inspectXML(); // cannot use a static method here because of run-time binding
         }
      });
      readItem.setAccelerator(KeyStroke.getKeyStroke('L', MENU_SHORTCUT_KEY_MASK));
      readItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            // readParameters(); // cannot use a static method here because of run-time binding
            loadXML((String) null);
         }
      });
      clearItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            xmlDefault = null;
         }
      });
      // display menu
      loadDisplayMenu();
      // help menu
      JMenu helpMenu = new JMenu(ControlsRes.getString("ControlFrame.Help")); //$NON-NLS-1$
      menuBar.add(helpMenu);
      JMenuItem aboutItem = new JMenuItem(ControlsRes.getString("ControlFrame.About")); //$NON-NLS-1$
      aboutItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            //showAboutDialog(ControlFrame.this);
            ControlFrame.showAboutDialog(ControlFrame.this);
         }
      });
      helpMenu.add(aboutItem);
      JMenuItem sysItem = new JMenuItem(ControlsRes.getString("ControlFrame.System")); //$NON-NLS-1$
      sysItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            ControlUtils.showSystemProperties(true);
         }
      });
      helpMenu.add(sysItem);
      JMenuItem showItem = new JMenuItem(ControlsRes.getString("ControlFrame.Display_All_Frames")); //$NON-NLS-1$
      showItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            org.opensourcephysics.display.GUIUtils.showDrawingAndTableFrames();
         }
      });
      helpMenu.add(showItem);
      helpMenu.addSeparator();
      JMenuItem logItem = new JMenuItem(ControlsRes.getString("ControlFrame.Message_Log")); //$NON-NLS-1$
      logItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            OSPLog.getOSPLog().setVisible(true);
         }
      });
      helpMenu.add(logItem);
      logToFileItem = new JCheckBoxMenuItem(ControlsRes.getString("ControlFrame.Log_to_File")); //$NON-NLS-1$
      logToFileItem.setSelected(false);
      logToFileItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            JCheckBoxMenuItem item = (JCheckBoxMenuItem) e.getSource();
            OSPLog.getOSPLog().setLogToFile(item.isSelected());
         }
      });
      helpMenu.add(logToFileItem);
      validate();
   }

   /**
    * Adds a Display menu to the menu bar. Overrides OSPFrame method.
    *
    * @return the display menu
    */
   protected JMenu loadDisplayMenu() {
      JMenuBar menuBar = getJMenuBar();
      if(menuBar==null) {
         return null;
      }
      displayMenu = super.loadDisplayMenu();
      if(displayMenu==null) {
         displayMenu = new JMenu();
         displayMenu.setText(ControlsRes.getString("ControlFrame.Display"));
         menuBar.add(displayMenu);
      }
      // language menu
      languageMenu = new JMenu();
      languageMenu.setText(ControlsRes.getString("ControlFrame.Language"));
      Action languageAction = new AbstractAction() {
         public void actionPerformed(ActionEvent e) {
            String language = e.getActionCommand();
            OSPLog.finest("setting language to "+language);
            for(int i = 0; i<defaultLocales.length; i++) {
               if(language.equals(defaultLocales[i].getDisplayName())) {
                  ToolsRes.setLocale(defaultLocales[i]);
                  return;
               }
            }
         }
      };
      ButtonGroup languageGroup = new ButtonGroup();
      languageItems = new JMenuItem[defaultLocales.length];
      for(int i = 0; i<defaultLocales.length; i++) {
         languageItems[i] = new JRadioButtonMenuItem(defaultLocales[i].getDisplayName(defaultLocales[i]));
         languageItems[i].setActionCommand(defaultLocales[i].getDisplayName());
         languageItems[i].addActionListener(languageAction);
         languageMenu.add(languageItems[i]);
         languageGroup.add(languageItems[i]);
      }
      for (int i = 0; i<defaultLocales.length; i++){
         if (defaultLocales[i].getLanguage().equals(ToolsRes.getLanguage())){
            languageItems[i].setSelected(true);
         }
      }
      if(authorMode || !launcherMode)displayMenu.add(languageMenu);  // add the menu if program is stand-alone or if user is authoring.
      //font menu
      JMenu fontMenu = new JMenu(DisplayRes.getString("DrawingFrame.Font_menu_title")); //$NON-NLS-1$
      displayMenu.add(fontMenu);
      JMenuItem sizeUpItem = new JMenuItem(ControlsRes.getString("ControlFrame.Increase_Font_Size")); //$NON-NLS-1$
      sizeUpItem.addActionListener(new ActionListener(){
         public void actionPerformed(ActionEvent e){
            FontSizer.levelUp();
         }
      });
      fontMenu.add(sizeUpItem);
      final JMenuItem sizeDownItem = new JMenuItem(ControlsRes.getString("ControlFrame.Decrease_Font_Size")); //$NON-NLS-1$
      sizeDownItem.addActionListener(new ActionListener(){
         public void actionPerformed(ActionEvent e){
            FontSizer.levelDown();
         }
      });
      fontMenu.add(sizeDownItem);
      fontMenu.addChangeListener(new ChangeListener() {
        public void stateChanged(ChangeEvent e) {
          sizeDownItem.setEnabled(FontSizer.getLevel() > 0);
        }
      });
      return displayMenu;
   }

   /**
    * Refreshes the user interface in response to display changes such as Language.
    */
   protected void refreshGUI(){
      super.refreshGUI();
      createMenuBar();
   }

   /**
    * Shows the about dialog.
    */
   public static void showAboutDialog(Component parent) {
      String aboutString = "OSP Library "+ControlUtils.version+" released "+ControlUtils.releaseDate+"\n" //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
                           +"Open Source Physics Project \n"+"www.opensourcephysics.org"; //$NON-NLS-1$ //$NON-NLS-2$
      JOptionPane.showMessageDialog(parent, aboutString, "About Open Source Physics", JOptionPane.INFORMATION_MESSAGE); //$NON-NLS-1$
   }

   /** Saves a file containing the control parameters to the disk. */
   public void save() {
      ControlUtils.saveToFile(this, ControlFrame.this);
   }

   /** Loads a file containing the control parameters from the disk. */
   public void readParameters() {
      ControlUtils.loadParameters((Control) this, ControlFrame.this);
   }

   /** Copies the data in the table to the system clipboard */
   public void copy() {
      Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
      StringSelection stringSelection = new StringSelection(this.toString());
      clipboard.setContents(stringSelection, stringSelection);
   }

   public void saveXML() {
      JFileChooser chooser = getChooser();
      if(chooser==null) {
         return;
      }
      String oldTitle = chooser.getDialogTitle();
      chooser.setDialogTitle(ControlsRes.getString("ControlFrame.Save_XML_Data")); //$NON-NLS-1$
      int result = chooser.showSaveDialog(null);
      chooser.setDialogTitle(oldTitle);
      if(result==JFileChooser.APPROVE_OPTION) {
         File file = chooser.getSelectedFile();
         // check to see if file already exists
         if(file.exists()) {
            int selected = JOptionPane.showConfirmDialog(null, ControlsRes.getString("ControlFrame.Replace_existing")+file.getName()+ControlsRes.getString("ControlFrame.question_mark"), ControlsRes.getString("ControlFrame.Replace_File"), //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
               JOptionPane.YES_NO_CANCEL_OPTION);
            if(selected!=JOptionPane.YES_OPTION) {
               return;
            }
         }
         OSPFrame.chooserDir = chooser.getCurrentDirectory().toString();
         String fileName = file.getAbsolutePath();
         // String fileName = XML.getRelativePath(file.getAbsolutePath());
         if((fileName==null)||fileName.trim().equals("")) { //$NON-NLS-1$
            return;
         }
         int i = fileName.toLowerCase().lastIndexOf(".xml"); //$NON-NLS-1$
         if(i!=fileName.length()-4) {
            fileName += ".xml"; //$NON-NLS-1$
         }
         XMLControl xml = new XMLControlElement(getOSPApp());
         xml.write(fileName);
      }
   }

   public void loadXML(String[] args) {
      if(args!=null) {
         for(int i = 0; i<args.length; i++) {
            loadXML(args[i]);
         }
      }
   }

   public void loadXML(String fileName) {
      if((fileName==null)||fileName.trim().equals("")) { //$NON-NLS-1$
         loadXML();
         return;
      }
      XMLControlElement xml = new XMLControlElement(fileName);
      // if xml object class is an OSPApplication, load app
      if(OSPApplication.class.isAssignableFrom(xml.getObjectClass())) {
         xmlDefault = xml;
         xmlDefault.loadObject(getOSPApp());
      } else {
         JOptionPane.showMessageDialog(this, "\""+fileName+"\" is for "+xml.getObjectClass()+".", //$NON-NLS-1$ //$NON-NLS-2$
                                       "Incorrect XML Object Type", JOptionPane.WARNING_MESSAGE); //$NON-NLS-1$
      }
   }

   public void loadXML() {
      JFileChooser chooser = getChooser();
      if(chooser==null) {
         return;
      }
      String oldTitle = chooser.getDialogTitle();
      chooser.setDialogTitle(ControlsRes.getString("ControlFrame.Load_XML_Data")); //$NON-NLS-1$
      int result = chooser.showOpenDialog(null);
      chooser.setDialogTitle(oldTitle);
      if(result==JFileChooser.APPROVE_OPTION) {
         OSPFrame.chooserDir = chooser.getCurrentDirectory().toString();
         String fileName = chooser.getSelectedFile().getAbsolutePath();
         loadXML(fileName);
         // loadXML(XML.getRelativePath(fileName));
      }
   }

   public void inspectXML() {
      // display a TreePanel in a modal dialog
      XMLControl xml = new XMLControlElement(getOSPApp());
      XMLTreePanel treePanel = new XMLTreePanel(xml);
      JDialog dialog = new JDialog((java.awt.Frame) null, true);
      dialog.setContentPane(treePanel);
      dialog.setSize(new Dimension(600, 300));
      dialog.setVisible(true);
   }

   protected OSPApplication getOSPApp() {
      if(ospApp==null) {
         ospApp = new OSPApplication(this, model);
      }
      return ospApp;
   }
}
/*
 * Open Source Physics software is free software; you can redistribute
 * it and/or modify it under the terms of the GNU General Public License (GPL) as
 * published by the Free Software Foundation; either version 2 of the License,
 * or(at your option) any later version.
 *
 * Code that uses any portion of the code in the org.opensourcephysics package
 * or any subpackage (subdirectory) of this package must must also be be released
 * under the GNU GPL license.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston MA 02111-1307 USA
 * or view the license online at http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2007  The Open Source Physics project
 *                     http://www.opensourcephysics.org
 */
