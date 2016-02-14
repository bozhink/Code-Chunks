/*
 * Open Source Physics software is free software as described near the bottom of this code file.
 *
 * For additional information and documentation on Open Source Physics please see:
 * <http://www.opensourcephysics.org/>
 */

package org.opensourcephysics.display;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;
import javax.imageio.ImageIO;
import javax.swing.*;
import org.jibble.epsgraphics.EpsGraphics2D;
import org.opensourcephysics.display3d.core.DrawingFrame3D;

public class GUIUtils {
  public static Map charMap = new HashMap();

  static {
    // upper case
    charMap.put("\\Alpha", "\u0391");
    charMap.put("\\Beta", "\u0392");
    charMap.put("\\Gamma", "\u0393");
    charMap.put("\\Delta", "\u0394");
    charMap.put("\\Epsilon", "\u0395");
    charMap.put("\\Zeta", "\u0396");
    charMap.put("\\Eta", "\u0397");
    charMap.put("\\Theta", "\u0398");
    charMap.put("\\Pi", "\u03a0");
    charMap.put("\\Rho", "\u03a1");
    charMap.put("\\Sigma", "\u03a3");
    charMap.put("\\Tau", "\u03a4");
    charMap.put("\\Phi", "\u03a6");
    charMap.put("\\Chi", "\u03a7");
    charMap.put("\\Psi", "\u03a8");
    charMap.put("\\Omega", "\u03a9");
    charMap.put("\\Xi", "\u039e");
    // lower case
    charMap.put("\\alpha", "\u03b1");
    charMap.put("\\beta", "\u03b2");
    charMap.put("\\gamma", "\u03b3");
    charMap.put("\\delta", "\u03b4");
    charMap.put("\\epsilon", "\u03b5");
    charMap.put("\\zeta", "\u03b6");
    charMap.put("\\eta", "\u03b7");
    charMap.put("\\theta", "\u03b8");
    charMap.put("\\iota", "\u03b9");
    charMap.put("\\kappa", "\u03ba");
    charMap.put("\\lamda", "\u03bb");
    charMap.put("\\mu", "\u03bc");
    charMap.put("\\micro", "\u03bc");
    charMap.put("\\nu", "\u03bd");
    charMap.put("\\xi", "\u03be");
    charMap.put("\\pi", "\u03c0");
    charMap.put("\\rho", "\u03c1");
    charMap.put("\\sigma", "\u03c3");
    charMap.put("\\tau", "\u03c4");
    charMap.put("\\phi", "\u03c6");
    charMap.put("\\chi", "\u03c7");
    charMap.put("\\psi", "\u03c8");
    charMap.put("\\omega", "\u03c9");
    // special characters
    charMap.put("\\degree", "\u00b0");
  }
  private GUIUtils() {} // prohibits instantiation

  public static String parseTeX(String inputStr) {
    if(inputStr==null) {
      return null;
    }
    String[] chunks = inputStr.split("\\$");
    // boolean mathMode=(inputStr.charAt(0)=='$');
    boolean mathMode = false;
    for(int i = 0;i<chunks.length;i++) {
      if(mathMode) {
        String val = (String) charMap.get(chunks[i].trim());
        if(val!=null) {
          chunks[i] = val;
        }
      }
      mathMode = !mathMode;
    }
    String outStr = "";
    for(int i = 0;i<chunks.length;i++) {
      outStr += chunks[i];
    }
    return outStr;
  }

  /**
   * Finds an instance of a class in the given container.
   *
   * @param container Container
   * @param c Class
   * @return Component
   */
  public static Component findInstance(Container container, Class c){
  if (container==null || c.isInstance(container)) {
    return container;
  }
  Component[] components=container.getComponents();
  for(int i=0, n=components.length; i<n; i++){
    if(c.isInstance(components[i])){
      return components[i];
    }
    if(components[i] instanceof Container){
      Component comp = findInstance((Container)components[i],c);
      if(c.isInstance(comp)) return comp;
    }
  }
  return null;
}


  /**
   * Shows all drawing and table frames.
   *
   * Usually invoked when a model is initialized but may be invoked at other times
   * to show frames that have been closed.
   */
  public static void showDrawingAndTableFrames() {
    Frame[] frames = Frame.getFrames();
    for(int i = 0;i<frames.length;i++) {
      if(!frames[i].isDisplayable()) {
        continue;
      }
      if((frames[i].getName()!=null)&&(frames[i].getName().indexOf("Tool")>-1)) {
        continue;
      }
      if(OSPFrame.class.isInstance(frames[i])) {
        if(DataTableFrame.class.isInstance(frames[i])) {
          ((DataTableFrame) frames[i]).refreshTable();
        }
        frames[i].setVisible(true);
        ((OSPFrame) frames[i]).invalidateImage(); // make sure buffers are up to date
        frames[i].repaint(); // repaint if frame is alrady showing
        frames[i].toFront();
      }
    }
    if ( (OSPFrame.applet != null)) {
      OSPFrame.applet.getRootPane().repaint();
    }

  }

  /**
   * Renders all OSPFrames whose animated property is true.
   *
   * Usually invoked by an anination thread after every animation step.
   */
  public static void renderAnimatedFrames() {
    Frame[] frames = Frame.getFrames();
    for(int i = 0;i<frames.length;i++) {
      if(!frames[i].isDisplayable()||!OSPFrame.class.isInstance(frames[i])) {
        continue;
      }
      if(((OSPFrame) frames[i]).isAnimated()) {
        ((OSPFrame) frames[i]).render();
      }
    }
    if((OSPFrame.applet != null) && (OSPFrame.applet instanceof Renderable)){
      ((Renderable)OSPFrame.applet).render();
    }
  }

  /**
   * Repaints all OSPFrames whose animated property is true.
   *
   * Usually invoked by a control's single-step button.
   */
  public static void repaintAnimatedFrames() {
    Frame[] frames = Frame.getFrames();
    for(int i = 0;i<frames.length;i++) {
      if(!frames[i].isDisplayable()||!OSPFrame.class.isInstance(frames[i])) {
        continue;
      }
      if(((OSPFrame) frames[i]).isAnimated()) {
        ((OSPFrame) frames[i]).invalidateImage(); // make sure buffers are up to date
        ((OSPFrame) frames[i]).repaint();
      }
    }
  }

  /**
   * Clears the data in animated DrawingFrames and repaints the frame's content.
   *
   * All frames are cleared if <code> clearAll<\code> is true; otherwise only frames whose <code>autoClear<\code> flag is
   * true will be cleared.
   *
   * @param clearAll  clears all frames if true
   */
  public static void clearDrawingFrameData(boolean clearAll) {
    Frame[] frames = Frame.getFrames();
    for(int i = 0;i<frames.length;i++) {
      if(!frames[i].isDisplayable()) {
        continue;
      }
      if(OSPFrame.class.isInstance(frames[i])) {
        OSPFrame frame = ((OSPFrame) frames[i]);
        if(clearAll||frame.isAutoclear()) {
          frame.clearDataAndRepaint();
        }
      }
    }
  }

  /**
   * Sets the IgnorRepaint for all animated frames to the given value.
   * @param ignoreRepaint boolean
   */
  public static void setAnimatedFrameIgnoreRepaint(boolean ignoreRepaint) {
    Frame[] frames = Frame.getFrames();
    for(int i = 0;i<frames.length;i++) {
      if(!frames[i].isDisplayable()||!DrawingFrame.class.isInstance(frames[i])) {
        continue;
      }
      if(((DrawingFrame) frames[i]).isAnimated()) {
        DrawingPanel dp=((DrawingFrame) frames[i]).getDrawingPanel();
        if(dp!=null)dp.setIgnoreRepaint(ignoreRepaint);
      }
    }
  }

  /**
   * Enables and disables the menu bars in DrawingFrames.
   *
   * Usually invoked when a model is initialized but may be invoked at other times.
   */
  public static void enableMenubars(boolean enable) {
    Frame[] frames = Frame.getFrames();
    for(int i = 0;i<frames.length;i++) {
      if(!frames[i].isDisplayable()) {
        continue;
      }
      if((frames[i].getName()!=null)&&(frames[i].getName().indexOf("Tool")>-1)) {
        continue;
      }
      if(DrawingFrame.class.isInstance(frames[i])||frames[i] instanceof DrawingFrame3D) {
        JMenuBar bar = ((JFrame) frames[i]).getJMenuBar();
        if(bar!=null) {
          for(int j = 0, n = bar.getMenuCount();j<n;j++) {
            bar.getMenu(j).setEnabled(enable);
          }
        }
      }
    }
  }

  /**
   * Disposes all OSP frames except the given frame.
   *
   * Usually invoked when the control window is being closed.
   *
   * @param frame will not be disposed
   */
  public static void closeAndDisposeOSPFrames(Frame frame) {
    Frame[] frames = Frame.getFrames();
    for(int i = 0;i<frames.length;i++) {
      if(frames[i]==frame) {
        continue;
      }
      // if (frames[i] instanceof org.opensourcephysics.controls.Launcher.LauncherFrame)continue;
      if(OSPFrame.class.isInstance(frames[i])) {
        ((OSPFrame) frames[i]).setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        ((OSPFrame) frames[i]).setVisible(false);
        ((OSPFrame) frames[i]).dispose();
      }
    }
  }

  /**
   * Gets a random color.
   *
   * @return random color
   */
  public static Color randomColor() {
    return new Color((int) (Math.random()*255), (int) (Math.random()*255), (int) (Math.random()*255));
  }

  /**
   *   Pops up a "Save File" file chooser dialog and takes user through process of saving a file.
   *
   *   @param    parent  the parent component of the dialog,
   *                     can be <code>null</code>;
   *                    see <code>showDialog</code> in class JFileChooser for details
   *   @return   the file or null if an error occurred:
   */
  public static File showSaveDialog(Component parent) {
    return showSaveDialog(parent, "Save");
  }

  /**
   *   Pops up a "Save File" file chooser dialog and takes user through process of saving a file.
   *
   *   @param    parent  the parent component of the dialog,
   *                     can be <code>null</code>;
   *                    see <code>showDialog</code> in class JFileChooser for details
   *   @param    title
   *   @return   the file or null if an error occurred:
   */
  public static File showSaveDialog(Component parent, String title) {
    // JFileChooser fileChooser =  new JFileChooser();
    JFileChooser fileChooser = OSPFrame.getChooser();
    // fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
    if(fileChooser==null) {
      return null;
    }
    String oldTitle = fileChooser.getDialogTitle();
    fileChooser.setDialogTitle(title);
    int result = fileChooser.showSaveDialog(parent);
    fileChooser.setDialogTitle(oldTitle);
    if(result!=JFileChooser.APPROVE_OPTION) {
      return null;
    }
    OSPFrame.chooserDir = fileChooser.getCurrentDirectory().toString();
    File file = fileChooser.getSelectedFile();
    if(file.exists()) {
      int selected = JOptionPane.showConfirmDialog(parent, "A file named "+file.getName()+" already exists.\nAre you sure you want to replace it?", "Warning", JOptionPane.YES_NO_CANCEL_OPTION);
      if(selected!=JOptionPane.YES_OPTION) {
        return null;
      }
    }
    return file;
  }

  public static File showOpenDialog(Component parent) {
    JFileChooser fileChooser = OSPFrame.getChooser(); // new JFileChooser();
    int result = fileChooser.showOpenDialog(parent);
    if(result!=JFileChooser.APPROVE_OPTION) {
      return null;
    }
    OSPFrame.chooserDir = fileChooser.getCurrentDirectory().toString();
    File file = fileChooser.getSelectedFile();
    return file;
  }

  /**
   * Test the time to render a drawable component.
   * @param drawable
   */
  public static void timingTest(Drawable drawable) {
    DrawingPanel dp = new DrawingPanel();
    DrawingFrame df = new DrawingFrame(dp);
    df.setVisible(true);
    dp.addDrawable(drawable);
    dp.scale();
    dp.setPixelScale();
    Graphics g2 = dp.getGraphics();
    if(g2==null) {
      return;
    }
    long startTime = System.currentTimeMillis();
    drawable.draw(dp, g2); // first drawing often takes longer because of initialization
    System.out.print("first drawing="+(System.currentTimeMillis()-startTime));
    startTime = System.currentTimeMillis(); // reset the time
    for(int i = 0;i<5;i++) {
      drawable.draw(dp, g2);
    }
    System.out.println("  avg time/drawing="+((System.currentTimeMillis()-startTime)/5));
    g2.dispose();
  }

  /**
   *  Saves the contents of the specified component in the given file format. Note method requires Java 1.4
   *
   * @param  comp
   * @param  outputFile  the output file
   * @param  outputFileFormat output file format. One of eps, jpeg, or png
   */
  public static void saveImage(JComponent comp, File outputFile, String outputFileFormat) throws IOException {
    FileOutputStream fos = null;
    try {
      fos = new FileOutputStream(outputFile);
      if(outputFileFormat.equals("eps")) {
        EpsGraphics2D g = new EpsGraphics2D("", fos, 0, 0, comp.getWidth(), comp.getHeight());
        comp.paint(g);
        g.scale(0.24, 0.24); // Set resolution to 300 dpi (0.24 = 72/300)
        // g.setColorDepth(EpsGraphics2D.BLACK_AND_WHITE); // Black & white
        g.close();
      } else {
        BufferedImage bi = new BufferedImage(comp.getWidth(), comp.getHeight(), BufferedImage.TYPE_3BYTE_BGR);
        Graphics g = bi.getGraphics();
        comp.paint(g);
        g.dispose();
        ImageIO.write(bi, outputFileFormat, fos);
        fos.close();
      }
    } finally {
      if(fos!=null) {
        fos.close();
      }
    }
  }

  /**
   *  Saves the contents of the specified component in the given file format.  Pops
   *  open a save file dialog to allow the user to select the output file. Note method requires Java 1.4
   *
   * @param  component   comp the component
   * @param  ouputFileFormat output file format. One of eps, jpeg, or png
   * @param  parent  dialog parent
   */
  public static void saveImage(JComponent component, String ouputFileFormat, Component parent) {
    File outputFile = GUIUtils.showSaveDialog(component, "Save Image");
    if(outputFile==null) {
      return;
    }
    try {
      GUIUtils.saveImage(component, outputFile, ouputFileFormat);
    } catch(IOException ioe) {
      JOptionPane.showMessageDialog(parent, "An error occurred while saving the file "+outputFile.getName()+".'");
    }
  }

  /**
   * Creates a JFileChooser with given desription and extensions
   * @param description String A description string
   * @param extensions String[] An array of allowed extensions
   * @return JFileChooser
   */
  static public javax.swing.JFileChooser createChooser(String description, String[] extensions){
     javax.swing.JFileChooser chooser = new javax.swing.JFileChooser(new File(OSPFrame.chooserDir));
     ExtensionFileFilter filter = new ExtensionFileFilter();
     for (int i=0; i<extensions.length; i++) filter.addExtension(extensions[i]);
     filter.setDescription(description);
     chooser.setFileFilter(filter);
     return chooser;
  }

  /**
   * Uses a JFileChooser to ask for a name.
   * @param chooser JFileChooser
   * @return String The absolute pah of the filename. Null if cancelled
   */
  static public String chooseFilename(JFileChooser chooser){
    return chooseFilename(chooser,null,true);

  }

  /**
   * Uses a JFileChooser to ask for a name.
   * @param chooser JFileChooser
   * @param parent Parent component for messages
   * @param toSave true if we will save to the chosen file, false if we will read from it
   * @return String The absolute pah of the filename. Null if cancelled
   */
  static public String chooseFilename(JFileChooser chooser, Component parent, boolean toSave){
     String fileName = null;
     int result;
     if (toSave) result = chooser.showSaveDialog(parent);
     else result = chooser.showOpenDialog(parent);
     if (result==JFileChooser.APPROVE_OPTION){
        OSPFrame.chooserDir = chooser.getCurrentDirectory().toString();
        File file = chooser.getSelectedFile();
        // check to see if file exists
        if (toSave) {  // saving: check if the file will be overwritten
           if (file.exists()){
             int selected = JOptionPane.showConfirmDialog(parent,
                DisplayRes.getString("DrawingFrame.ReplaceExisting_message")+" "+
                file.getName()+DisplayRes.getString("DrawingFrame.QuestionMark"),
                DisplayRes.getString("DrawingFrame.ReplaceFile_option_title"), //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
                JOptionPane.YES_NO_CANCEL_OPTION);
             if (selected!=JOptionPane.YES_OPTION){
                return null;
             }
           }
        }
        else {  // Reading: check if thefile actually exists
          if (!file.exists()){
            JOptionPane.showMessageDialog(parent,DisplayRes.getString("GUIUtils.FileDoesntExist")+" "+file.getName(),
               DisplayRes.getString("GUIUtils.FileChooserError"), JOptionPane.ERROR_MESSAGE);
            return null;
          }
        }
        fileName = file.getAbsolutePath();
        if ((fileName==null)||fileName.trim().equals("")){ //$NON-NLS-1$
           return null;
        }
     }
     return fileName;
  }

  /**
      This file filter matches all files with a given set of
      extensions.
   */
  static private class ExtensionFileFilter extends javax.swing.filechooser.FileFilter {
    private String description = "";
    private java.util.ArrayList extensions = new java.util.ArrayList();

     /**
        Adds an extension that this file filter recognizes.
        @param extension a file extension (such as ".txt" or "txt")
      */
     public void addExtension(String extension){
        if (!extension.startsWith(".")) extension = "."+extension;
        extensions.add(extension.toLowerCase());
     }

     /**
        Sets a description for the file set that this file filter
        recognizes.
        @param aDescription a description for the file set
      */
     public void setDescription(String aDescription){
        description = aDescription;
     }

     /**
        Returns a description for the file set that this file
        filter recognizes.
        @return a description for the file set
      */
     public String getDescription(){
        return description;
     }

     public boolean accept(File f){
        if (f.isDirectory())return true;
        String name = f.getName().toLowerCase();

        // check if the file name ends with any of the extensions
        for (int i = 0; i<extensions.size(); i++)
           if (name.endsWith((String) extensions.get(i)))
              return true;
        return false;
     }

  }

  /**
   * This method receives a list of objects which it exposes to the user.
   * The user can remove objects from the list and click ok.
   * The class then returns the modified list.
   * If the user clicks cancel it will return null
   * @param _target Component The dialog will be shown relative to this component
   * @param _size Dimension The size of the display dialog
   * @param _message String The message to display
   * @param _title String The title for the display dialog
   * @param _list AbstractList The initial list of objects
   * @return AbstractList
   */
  public static AbstractList confirmList (Component _target, Dimension _size, String _message, String _title, AbstractList _list) {
    class ReturnValue { boolean value = false; }
    final ReturnValue returnValue=new ReturnValue();

    final DefaultListModel listModel = new DefaultListModel();
    for (int i=0,n=_list.size(); i<n; i++) listModel.addElement(_list.get(i));
    final JList list = new JList(listModel);
    list.setEnabled(true);
    list.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
    list.setSelectionInterval(0,listModel.getSize()-1);
    JScrollPane scrollPane = new JScrollPane(list);
    scrollPane.setPreferredSize(_size);

    final JDialog dialog = new JDialog();

    java.awt.event.MouseAdapter mouseListener =  new java.awt.event.MouseAdapter () {
      public void mousePressed (java.awt.event.MouseEvent evt) {
        AbstractButton button = (AbstractButton) (evt.getSource());
        String aCmd = button.getActionCommand();
        if      (aCmd.equals("ok"))      { returnValue.value = true;  dialog.setVisible (false); }
        else if (aCmd.equals("cancel"))  { returnValue.value = false; dialog.setVisible (false); }
        else if (aCmd.equals("selectall")) { list.setSelectionInterval(0,listModel.getSize()-1); }
      }
    };

    JButton okButton = new JButton (DisplayRes.getString("GUIUtils.Ok"));
    okButton.setActionCommand ("ok");
    okButton.addMouseListener (mouseListener);

    JButton cancelButton = new JButton (DisplayRes.getString("GUIUtils.Cancel"));
    cancelButton.setActionCommand ("cancel");
    cancelButton.addMouseListener (mouseListener);

    JButton excludeButton = new JButton (DisplayRes.getString("GUIUtils.SelectAll"));
    excludeButton.setActionCommand ("selectall");
    excludeButton.addMouseListener (mouseListener);

    JPanel buttonPanel = new JPanel (new FlowLayout(FlowLayout.CENTER));
    buttonPanel.add (okButton);
    buttonPanel.add (excludeButton);
    buttonPanel.add (cancelButton);

    JPanel topPanel = new JPanel (new BorderLayout ());

    JTextArea textArea   = new JTextArea (_message);
    textArea.setWrapStyleWord(true);
    textArea.setLineWrap(true);
    textArea.setEditable(false);
    textArea.setFont(textArea.getFont().deriveFont(Font.BOLD));
    textArea.setBackground(topPanel.getBackground());
    textArea.setBorder(new javax.swing.border.EmptyBorder(5,5,10,5));

    topPanel.setBorder(new javax.swing.border.EmptyBorder(5,10,5,10));
    topPanel.add (textArea,BorderLayout.NORTH);
    topPanel.add (scrollPane,BorderLayout.CENTER);

    JSeparator sep1 = new JSeparator (SwingConstants.HORIZONTAL);

    JPanel southPanel = new JPanel (new java.awt.BorderLayout());
    southPanel.add (sep1,java.awt.BorderLayout.NORTH);
    southPanel.add (buttonPanel,java.awt.BorderLayout.SOUTH);

    dialog.getContentPane().setLayout (new java.awt.BorderLayout(5,0));
    dialog.getContentPane().add (topPanel,java.awt.BorderLayout.CENTER);
    dialog.getContentPane().add (southPanel,java.awt.BorderLayout.SOUTH);

    dialog.addWindowListener (
      new java.awt.event.WindowAdapter() {
        public void windowClosing(java.awt.event.WindowEvent event) { returnValue.value = false; }
      }
    );

//    dialog.setSize (_size);
    dialog.validate();
    dialog.pack();
    dialog.setTitle (_title);
    dialog.setLocationRelativeTo (_target);
    dialog.setModal(true);

    dialog.setVisible (true);
    if (!returnValue.value) return null;
    Object[] selection = list.getSelectedValues();
    AbstractList newList = new ArrayList();
    for (int i=0,n=selection.length; i<n; i++) newList.add(selection[i]);
    return newList;
  }

  static public boolean isWindowsOS() {
    try { // system properties may not be readable in some environments
      return (System.getProperty("os.name").startsWith("Windows"));
    } catch(SecurityException ex) {
      return false;
    }
  }

  static public boolean isMacOS() {
    try { // system properties may not be readable in some environments
      return (System.getProperty("os.name").startsWith("Mac"));
    } catch(SecurityException ex) {
      return false;
    }
  }
}

/*
 * Open Source Physics software is free software; you can redistribute
 * it and/or modify it under the terms of the GNU General Public License (GPL) as
 * published by the Free Software Foundation; either version 2 of the License,
 * or(at your option) any later version.

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
