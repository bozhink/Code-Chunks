/*
 * Open Source Physics software is free software as described near the bottom of this code file.
 *
 * For additional information and documentation on Open Source Physics please see:
 * <http://www.opensourcephysics.org/>
 */

package org.opensourcephysics.ejs.control;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.File;
import javax.swing.*;
import javax.swing.event.SwingPropertyChangeSupport;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.OSPFrame;
import org.opensourcephysics.tools.FontSizer;
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;
import org.opensourcephysics.display.DrawingPanel;
import java.beans.PropertyChangeEvent;
import java.util.Locale;
import org.opensourcephysics.ejs.EjsRes;
import org.opensourcephysics.tools.TranslatorTool;
import org.opensourcephysics.tools.ToolsRes;
import org.opensourcephysics.tools.LocalJob;
import org.opensourcephysics.tools.SnapshotTool;
import org.opensourcephysics.display.DisplayRes;
import org.opensourcephysics.tools.DatasetTool;
import org.opensourcephysics.tools.VideoCaptureTool;
import org.opensourcephysics.media.core.VideoGrabber;
import java.rmi.RemoteException;
import org.opensourcephysics.tools.Job;
import java.util.Iterator;
import org.opensourcephysics.tools.Tool;
import java.util.ArrayList;
import org.opensourcephysics.display.Dataset;

/**
 * EjsControlFrame defines an Easy Java Simulations control that is guaranteed to have a
 * parent frame.
 *
 * @author       Wolfgang Christian
 * @version 1.0
 */
public class EjsControlFrame extends ParsedEjsControl implements RootPaneContainer {

   final static int MENU_SHORTCUT_KEY_MASK = Toolkit.getDefaultToolkit().getMenuShortcutKeyMask();
   protected Tool reply;
   protected JMenuItem[] languageItems;
   protected JMenuItem translateItem, snapshotItem, videoItem;
   protected JMenu languageMenu;
   OSPFrame frame = new OSPFrame() {

      public void render() {
         EjsControlFrame.this.render();
      }

      public void clearData() {
         EjsControlFrame.this.clearData();
      }

      public void clearDataAndRepaint() {
         EjsControlFrame.this.clearDataAndRepaint();
      }
   };
   DrawingPanel defaultDrawingPanel;
   JFrame messageFrame = new JFrame(EjsRes.getString("EjsControlFrame.Messages_frame_title")); //$NON-NLS-1$
   TextArea messageArea = new TextArea(20, 20);
   Object model;
   JMenuBar menuBar;
   volatile protected XMLControlElement xmlDefault=null;
   protected PropertyChangeSupport support = new SwingPropertyChangeSupport(this);

   /**
    * Constructor EjsControlFrame
    *
    * @param _simulation
    */
   public EjsControlFrame(Object _simulation) {
      this(_simulation, "name=controlFrame;title=Control Frame;location=400,0;layout=border;exit=false; visible=true"); //$NON-NLS-1$
   }

   /**
    * Constructor EjsControlFrame
    *
    * @param _simulation
    * @param param
    */
   public EjsControlFrame(Object _simulation, String param) {
      super(_simulation);
      model = _simulation;
      frame.setName("controlFrame"); //$NON-NLS-1$
      addObject(frame, "Frame", param); //$NON-NLS-1$
      createMenuBar();
      if(org.opensourcephysics.display.OSPFrame.appletMode) {
         frame.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
      }
      messageFrame.getContentPane().add(messageArea);
      messageFrame.setSize(300, 175);
      // responds to data from the DatasetTool
      reply = new Tool() {
         public void send(Job job, Tool replyTo) throws RemoteException {
           if(defaultDrawingPanel==null) return;
            XMLControlElement control = new XMLControlElement();
            try {
               control.readXML(job.getXML());
            } catch(RemoteException ex) {}
            ArrayList datasets = defaultDrawingPanel.getObjectOfClass(Dataset.class);
            Iterator it = control.getObjects(Dataset.class).iterator();
            while(it.hasNext()) {
               Dataset newData = (Dataset) it.next();
               int id = newData.getID();
               for(int i = 0, n = datasets.size(); i<n; i++) {
                  if(((Dataset) datasets.get(i)).getID()==id) {
                     XMLControl xml = new XMLControlElement(newData);      // convert the source to xml
                     Dataset.getLoader().loadObject(xml, datasets.get(i)); // copy the data to the destination
                     break;
                  }
               }
            }
            defaultDrawingPanel.repaint();
         }
      };
   }

   private void createMenuBar() {
     menuBar = new JMenuBar();
     frame.setJMenuBar(menuBar);
     JMenu fileMenu = new JMenu(EjsRes.getString("EjsControlFrame.File_menu")); //$NON-NLS-1$
     menuBar.add(fileMenu);
     JMenuItem readItem = new JMenuItem(EjsRes.getString("EjsControlFrame.Read_menu_item")); //$NON-NLS-1$
     JMenuItem saveAsItem = new JMenuItem(EjsRes.getString("EjsControlFrame.SaveAs_menu_item")); //$NON-NLS-1$
     JMenuItem inspectItem = new JMenuItem(EjsRes.getString("EjsControlFrame.Inspect_menu_item")); //$NON-NLS-1$
     fileMenu.add(readItem);
     fileMenu.add(saveAsItem);
     fileMenu.add(inspectItem);
     readItem.setAccelerator(KeyStroke.getKeyStroke('R', MENU_SHORTCUT_KEY_MASK));
     readItem.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent e) {
           // readParameters(); // cannot use a static method here because of run-time binding
           loadXML((String) null);
           support.firePropertyChange("xmlDefault", null, xmlDefault); //$NON-NLS-1$
           frame.repaint();
        }
     });
     saveAsItem.setAccelerator(KeyStroke.getKeyStroke('S', MENU_SHORTCUT_KEY_MASK));
     saveAsItem.addActionListener(new ActionListener() {

        public void actionPerformed(ActionEvent e) {
           saveXML();
        }
     });
     inspectItem.addActionListener(new ActionListener() {

        public void actionPerformed(ActionEvent e) {
           inspectXML(); // cannot use a static method here because of run-time binding
        }
     });
     loadDisplayMenu();
     loadToolsMenu();
     //help menu
     JMenu helpMenu = new JMenu(EjsRes.getString("EjsControlFrame.Help_menu")); //$NON-NLS-1$
     menuBar.add(helpMenu);
     JMenuItem aboutItem = new JMenuItem(EjsRes.getString("EjsControlFrame.About_menu_item")); //$NON-NLS-1$
     aboutItem.addActionListener(new ActionListener() {

        public void actionPerformed(ActionEvent e) {
           ControlFrame.showAboutDialog(EjsControlFrame.this.getFrame());
        }
     });
     helpMenu.add(aboutItem);
     JMenuItem sysItem = new JMenuItem(EjsRes.getString("EjsControlFrame.System_menu_item")); //$NON-NLS-1$
     sysItem.addActionListener(new ActionListener() {

        public void actionPerformed(ActionEvent e) {
           ControlUtils.showSystemProperties(true);
        }
     });
     helpMenu.add(sysItem);
     helpMenu.addSeparator();
     JMenuItem logToFileItem = new JCheckBoxMenuItem(EjsRes.getString("EjsControlFrame.LogToFile_check_box")); //$NON-NLS-1$
     logToFileItem.setSelected(false);
     logToFileItem.addActionListener(new ActionListener() {

        public void actionPerformed(ActionEvent e) {
           JCheckBoxMenuItem item = (JCheckBoxMenuItem) e.getSource();
           OSPLog.getOSPLog().setLogToFile(item.isSelected());
        }
     });
     helpMenu.add(logToFileItem);
     JMenuItem logItem = new JMenuItem(EjsRes.getString("EjsControlFrame.MessageLog_menu_item")); //$NON-NLS-1$
     logItem.addActionListener(new ActionListener() {

        public void actionPerformed(ActionEvent e) {
           OSPLog.getOSPLog().setVisible(true);
        }
     });
     helpMenu.add(logItem);
     menuBar.add(helpMenu);
   }

   /**
 * Adds a Tools menu to the menu bar.
 */
protected JMenu loadToolsMenu(){
   JMenuBar menuBar = frame.getJMenuBar();
   if(menuBar==null) {
      return null;
   }
   // create Tools menu item
   JMenu toolsMenu = new JMenu(DisplayRes.getString("DrawingFrame.Tools_menu_title")); //$NON-NLS-1$
   menuBar.add(toolsMenu);
   // test dataset tool
   JMenuItem datasetItem = new JMenuItem(DisplayRes.getString("DrawingFrame.DatasetTool_menu_item")); //$NON-NLS-1$
   toolsMenu.add(datasetItem);
   datasetItem.addActionListener(new ActionListener() {

      public void actionPerformed(ActionEvent e) {
         try {
            if(defaultDrawingPanel==null) return;
            DatasetTool tool = DatasetTool.getTool();
            tool.send(new LocalJob(defaultDrawingPanel), reply);
            tool.setVisible(true);
         } catch(RemoteException ex) {}
      }
   });
   snapshotItem = new JMenuItem("Snapshot");
   snapshotItem.setEnabled(false);
   toolsMenu.add(snapshotItem);
   snapshotItem.addActionListener(new ActionListener(){
     public void actionPerformed(ActionEvent e){
        SnapshotTool tool=SnapshotTool.getTool();
        if(defaultDrawingPanel!=null){
           tool.saveImage(null, defaultDrawingPanel);
        }else{
        tool.saveImage(null, getContentPane());
        }
   }});
   videoItem = new JMenuItem("Video Capture");
   videoItem.setEnabled(false);
   toolsMenu.add(videoItem);
   videoItem.addActionListener(new ActionListener(){
     public void actionPerformed(ActionEvent e){
        if(defaultDrawingPanel==null){
          return;
        }
        VideoCaptureTool tool=defaultDrawingPanel.getVideoCaptureTool();
        if(tool==null){
           tool = VideoGrabber.getTool();
           defaultDrawingPanel.setVideoCaptureTool(tool);
           tool.setVisible(true);
           tool.clear();
        }else{
           tool.setVisible(true);
        }
     }});
   return toolsMenu;
}


   /**
    * Adds a Display menu to the menu bar.
    */
   protected void loadDisplayMenu() {
      JMenu displayMenu = new JMenu();
      displayMenu.setText(EjsRes.getString("EjsControlFrame.Display_menu")); //$NON-NLS-1$
      menuBar.add(displayMenu);
      // language menu
      ToolsRes.addPropertyChangeListener("locale", new PropertyChangeListener() { //$NON-NLS-1$
         public void propertyChange(PropertyChangeEvent e) {
            refreshGUI();
         }
      });
      languageMenu = new JMenu();
      languageMenu.setText(EjsRes.getString("EjsControlFrame.Language"));//$NON-NLS-1$
      translateItem = new JMenuItem();
      translateItem.setText(EjsRes.getString("EjsControlFrame.Translate")); //$NON-NLS-1$
      translateItem.addActionListener(new ActionListener(){
         public void actionPerformed(ActionEvent e){
            TranslatorTool tool = TranslatorTool.getTool();
            tool.showProperties(model.getClass());
            tool.setKeepHidden(false);
            tool.setVisible(true);
         }
      });
      languageMenu.add(translateItem, 0);
      final Locale[] locales=OSPFrame.getDefaultLocales();
      Action languageAction = new AbstractAction() {
         public void actionPerformed(ActionEvent e) {
            String language = e.getActionCommand();
            OSPLog.finest("setting language to "+language); //$NON-NLS-1$
            for(int i = 0; i<locales.length; i++) {
               if(language.equals(locales[i].getDisplayName())) {
                  ToolsRes.setLocale(locales[i]);
                  return;
               }
            }
         }
      };
      ButtonGroup languageGroup = new ButtonGroup();
      languageItems = new JMenuItem[locales.length];
      for(int i = 0; i<locales.length; i++) {
         languageItems[i] = new JRadioButtonMenuItem(locales[i].getDisplayName(locales[i]));
         languageItems[i].setActionCommand(locales[i].getDisplayName());
         languageItems[i].addActionListener(languageAction);
         languageMenu.add(languageItems[i]);
         languageGroup.add(languageItems[i]);
      }
      for(int i = 0; i<locales.length; i++) {
         if(locales[i].getLanguage().equals(ToolsRes.getLanguage())) {
            languageItems[i].setSelected(true);
         }
      }
      displayMenu.add(languageMenu);
      JMenu fontMenu = new JMenu(EjsRes.getString("EjsControlFrame.Font_menu")); //$NON-NLS-1$
      displayMenu.add(fontMenu);
      JMenuItem sizeUpItem = new JMenuItem();
      sizeUpItem.setText(EjsRes.getString("EjsControlFrame.IncreaseFontSize_menu_item")); //$NON-NLS-1$
      sizeUpItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            FontSizer.levelUp();
         }
      });
      fontMenu.add(sizeUpItem);
      final JMenuItem sizeDownItem = new JMenuItem();
      sizeDownItem.setText(EjsRes.getString("EjsControlFrame.DecreaseFontSize_menu_item")); //$NON-NLS-1$
      sizeDownItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            FontSizer.levelDown();
         }
      });
      fontMenu.add(sizeDownItem);
      JMenu aliasMenu = new JMenu(EjsRes.getString("EjsControlFrame.AntiAlias_menu")); //$NON-NLS-1$
      displayMenu.add(aliasMenu);
      final JCheckBoxMenuItem textAliasItem = new JCheckBoxMenuItem(EjsRes.getString("EjsControlFrame.Text_check_box"), false); //$NON-NLS-1$
      textAliasItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            defaultDrawingPanel.setAntialiasTextOn(textAliasItem.isSelected());
            defaultDrawingPanel.repaint();
         }
      });
      aliasMenu.add(textAliasItem);
      final JCheckBoxMenuItem shapeAliasItem = new JCheckBoxMenuItem(EjsRes.getString("EjsControlFrame.Drawing_check_box"), false); //$NON-NLS-1$
      shapeAliasItem.addActionListener(new ActionListener() {

         public void actionPerformed(ActionEvent e) {
            defaultDrawingPanel.setAntialiasShapeOn(shapeAliasItem.isSelected());
            defaultDrawingPanel.repaint();
         }
      });
      fontMenu.addChangeListener(new ChangeListener() {

         public void stateChanged(ChangeEvent e) {
            sizeDownItem.setEnabled(FontSizer.getLevel()>0);
         }
      });
      aliasMenu.addChangeListener(new ChangeListener() {

         public void stateChanged(ChangeEvent e) {
            if(defaultDrawingPanel==null) {
               textAliasItem.setEnabled(false);
               shapeAliasItem.setEnabled(false);
            } else {
               textAliasItem.setEnabled(true);
               textAliasItem.setEnabled(true);
               textAliasItem.setSelected(defaultDrawingPanel.isAntialiasTextOn());
               shapeAliasItem.setSelected(defaultDrawingPanel.isAntialiasShapeOn());
            }
         }
      });
      aliasMenu.add(shapeAliasItem);
      menuBar.add(displayMenu);
   }

   protected void refreshGUI(){
     createMenuBar();
     frame.pack();
   }

   /**
    * Adds a PropertyChangeListener.
    *
    * @param listener the object requesting property change notification
    */
   public void addPropertyChangeListener(PropertyChangeListener listener) {
      support.addPropertyChangeListener(listener);
   }

   /**
    * Removes a PropertyChangeListener.
    *
    * @param listener the listener requesting removal
    */
   public void removePropertyChangeListener(PropertyChangeListener listener) {
      support.removePropertyChangeListener(listener);
   }

   /**
    * Prints a string in the control's message area followed by a CR and LF.
    * GUI controls will usually display messages in a non-editable text area.
    *
    * @param s
    */
   public void println(String s) {
      if(s==null) {
         return;
      }
      messageArea.append(s+"\n"); //$NON-NLS-1$
      messageFrame.setVisible(true);
   }

   /**
    * Prints a blank line in the control's message area.  GUI controls will usually display
    * messages in a non-editable text area.
    */
   public void println() {
      messageArea.append("\n"); //$NON-NLS-1$
      messageFrame.setVisible(true);
   }

   /**
    * Stops the animation and prints a message.
    * @param message String
    */
   public void calculationDone(String message) {
      if((message==null)||message.trim().equals("")) { //$NON-NLS-1$
         return;
      } else {
         super.calculationDone(message);
      }
   }

   /**
    * Prints a string in the control's message area.
    * GUI controls will usually display messages in a non-editable text area.
    *
    * @param s
    */
   public void print(String s) {
      if(s==null) {
         return; //nothing to print
      }
      messageArea.append(s);
      messageFrame.setVisible(true);
   }

   /**
    * Clears all text from the control's message area.
    */
   public void clearMessages() {
      messageArea.setText(""); //$NON-NLS-1$
   }

   /**
    * Gets the frame that contains the control.
    *
    * @return
    */
   public OSPFrame getFrame() {
      return frame;
   }

   /**
    * Renders the frame.  Subclass this method to render the contents of this frame in the calling thread.
    */
   public void render() {}

   /**
    * Adds an existing object to this control.
    * @param object Object
    * @param classname String
    * @param propList String
    * @return ControlElement
    */
   public ControlElement addObject(Object object, String classname, String propList) {
      if(object instanceof DrawingPanel) {
         defaultDrawingPanel = (DrawingPanel) object;
         snapshotItem.setEnabled(true);
         videoItem.setEnabled(true);
      }
      return super.addObject(object, classname, propList);
   }

   /**
    * Clears data from drawing objects within this frame.
    *
    * The default method does nothing.
    * Override this method to clear objects that have data.
    */
   public void clearData() {}

   /**
    * Clears data from drawing objects within this frame.
    *
    * The default method does nothing.
    * Override this method to clear and repaint objects that have data.
    */
   public void clearDataAndRepaint() {}

   /**
    * Gets the frame that contains the control.
    *
    * @return
    */
   public Container getTopLevelAncestor() {
      return frame;
   }

   /**
    * Gets the frame's root pane.  Implementation of RootPaneContainer.
    *
    * @return
    */
   public JRootPane getRootPane() {
      return frame.getRootPane();
   }

   /**
    * Gets the frame's content pane. Implementation of RootPaneContainer.
    *
    * @return content pane of the frame
    */
   public Container getContentPane() {
      return frame.getContentPane();
   }

   /**
    * Sets the frame's content pane. Implementation of RootPaneContainer.
    * @param contentPane
    */
   public void setContentPane(Container contentPane) {
      frame.setContentPane(contentPane);
   }

   /**
    * Implementation of RootPaneContainer.
    *
    * @see javax.swing.RootPaneContainer
    *
    * @return layeredPane of the frame
    */
   public JLayeredPane getLayeredPane() {
      return frame.getLayeredPane();
   }

   /**
    * Implementation of RootPaneContainer.
    *
    * @see javax.swing.RootPaneContainer
    * @param layeredPane
    */
   public void setLayeredPane(JLayeredPane layeredPane) {
      frame.setLayeredPane(layeredPane);
   }

   /**
    * Implementation of RootPaneContainer.
    *
    * @see javax.swing.RootPaneContainer
    *
    * @return glas pane component
    */
   public Component getGlassPane() {
      return frame.getGlassPane();
   }

   /**
    * Implementation of RootPaneContainer.
    *
    * @see javax.swing.RootPaneContainer
    * @param glassPane
    */
   public void setGlassPane(Component glassPane) {
      frame.setGlassPane(glassPane);
   }

   public void parseXMLMenu(String xmlMenu) {
      if(menuBar==null) {
         return;
      }
      XMLControl xml = new XMLControlElement(xmlMenu);
      if(xml.failedToRead()) {
         OSPLog.info("Tools menu not found: "+xmlMenu); //$NON-NLS-1$
      } else {
         Class type = xml.getObjectClass();
         if((type!=null)&&org.opensourcephysics.tools.LaunchNode.class.isAssignableFrom(type)) {
            // load the xml data into a launch node and add the menu item
            org.opensourcephysics.tools.LaunchNode node = (org.opensourcephysics.tools.LaunchNode) xml.loadObject(null);
            // get the menu name and find or create the menu
            String menuName = node.toString();
            JMenu menu = null;
            for(int i = 0; i<menuBar.getMenuCount(); i++) {
               JMenu next = menuBar.getMenu(i);
               if(next.getText().equals(menuName)) {
                  menu = next;
                  break;
               }
            }
            if(menu==null) {
               menu = new JMenu(menuName);
               menuBar.add(menu);
               menuBar.validate();
            }
            // add the node item to the menu
            node.setLaunchObject(model);
            node.addMenuItemsTo(menu);
            OSPLog.finest("Tools menu loaded: "+xmlMenu); //$NON-NLS-1$
         }
      }
   }

   // The following methods the an XML framework for OSPApplications.
   protected OSPApplication app;
   public void saveXML() {
      JFileChooser chooser = OSPFrame.getChooser();
      int result = chooser.showSaveDialog(null);
      if(result==JFileChooser.APPROVE_OPTION) {
         File file = chooser.getSelectedFile();
         // check to see if file already exists
         if(file.exists()) {
            int selected = JOptionPane.showConfirmDialog(null, EjsRes.getString("EjsControlFrame.ReplaceExisting_dialog")+file.getName()+EjsRes.getString("EjsControlFrame.question_mark"), EjsRes.getString("EjsControlFrame.RepalceFile_dialog_message"), //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
               JOptionPane.YES_NO_CANCEL_OPTION);
            if(selected!=JOptionPane.YES_OPTION) {
               return;
            }
         }
         OSPFrame.chooserDir = chooser.getCurrentDirectory().toString();
         String fileName = XML.getRelativePath(file.getAbsolutePath());
         if((fileName==null)||fileName.trim().equals("")) { //$NON-NLS-1$
            return;
         }
         int i = fileName.toLowerCase().lastIndexOf(".xml");//$NON-NLS-1$
         if(i!=fileName.length()-4) {
            fileName += ".xml"; //$NON-NLS-1$
         }
         XMLControl xml = new XMLControlElement(getApp());
         xml.write(fileName);
      }
   }

   private OSPApplication getApp() {
      if(app==null) {
         app = new OSPApplication(this, model);
      }
      return app;
   }

   /**
    * Loads the current XML default.
    */
   public void loadDefaultXML() {
      if(xmlDefault!=null) {
        xmlDefault.loadObject(getApp());
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
         xml.loadObject(getApp());
      } else {
         JOptionPane.showMessageDialog(frame, "\""+fileName+"\" is for "+xml.getObjectClass()+".", //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
                                       "Incorrect XML Object Type", JOptionPane.WARNING_MESSAGE); //$NON-NLS-1$
      }
   }

   public void loadXML() {
      JFileChooser chooser = OSPFrame.getChooser();
      int result = chooser.showOpenDialog(null);
      if(result==JFileChooser.APPROVE_OPTION) {
         String fileName = chooser.getSelectedFile().getAbsolutePath();
         loadXML(XML.getRelativePath(fileName));
      }
   }

   public void inspectXML() {
      // display a TreePanel in a modal dialog
      XMLControl xml = new XMLControlElement(getApp());
      XMLTreePanel treePanel = new XMLTreePanel(xml);
      JDialog dialog = new JDialog((java.awt.Frame) null, true);
      dialog.setContentPane(treePanel);
      dialog.setSize(new Dimension(600, 300));
      dialog.setVisible(true);
   }

   public void loadXML(String[] args) {
      if(args!=null) {
         for(int i = 0; i<args.length; i++) {
            loadXML(args[i]);
         }
      }
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
