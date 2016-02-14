/*
 * Open Source Physics software is free software as described near the bottom of this code file.
 *
 * For additional information and documentation on Open Source Physics please see:
 * <http://www.opensourcephysics.org/>
 */

package org.opensourcephysics.display;
import java.awt.*;
import java.awt.image.BufferStrategy;
import java.awt.print.*;
import java.io.File;
import javax.swing.*;
import org.opensourcephysics.controls.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import org.opensourcephysics.tools.FontSizer;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeEvent;
import org.opensourcephysics.tools.ResourceLoader;
import org.opensourcephysics.tools.TranslatorTool;
import java.util.ArrayList;
import java.util.Iterator;
import org.opensourcephysics.tools.ToolsRes;
import java.util.Locale;

/**
 * OSPFrame is the base class for Open Source Physics JFrames such as DrawingFrame and DataTableFrame.
 *
 * Copyright:    Copyright (c) 2002
 * @author       Wolfgang Christian
 * @version 1.0
 */
public class OSPFrame extends JFrame implements Printable {

  /**
   * Look and feel property for the graphical user interface.
   */
  public static boolean DEFAULT_LOOK_AND_FEEL = false;

  /**
   * Location of OSP icon.
   */
  public static final String osp_icon_file = "/org/opensourcephysics/resources/controls/images/osp_icon.gif";

  /**
   * File Chooser starting directory.
   */
  public static String chooserDir;                                        // value is set in static block
  protected ArrayList customButtons = new ArrayList();                    // list of custom buttons, custom buttons are enabled when the animation is stopped
  protected static Locale[] defaultLocales =
      new Locale[]{Locale.ENGLISH, new Locale("es"),new Locale("de"), new Locale("da"),new Locale("sk"), Locale.TAIWAN}; //$NON-NLS-1$
  static int topx = 10;
  static int topy = 100;

  /** Set to <I>true</I> if a simulation should automatically render this frame after every animation step. */
  protected boolean animated = false;

  /** Set to <I>true</I> if a simulation should automatically clear the data when it is initialized. */
  protected boolean autoclear = false;

  /** Set <I>true</I> if the program is an applet. */
  public static boolean appletMode = false;

  /** Set <I>true</I> if a program is being run within Launcher. */
  protected static boolean launcherMode = false;

  /** Set <I>true</I> if a program should allows users to author internal parameters such as Locale strings. */
  protected static boolean authorMode = true;

  /** Set <I>true</I> if the Frame's defaultCloseOperation has been changed by Launcher. */
  private volatile boolean wishesToExit = false;

  /**
   * Field myApplet provides a static reference to an applet context
   * so that the document base and the code base can be obtained in applet mode.
   */
  public static JApplet applet;

  /** The thread group that created this object. */
  public ThreadGroup constructorThreadGroup = Thread.currentThread().getThreadGroup();
  protected boolean keepHidden = false;
  protected BufferStrategy strategy;
  private static JFileChooser chooser;
  protected JPanel buttonPanel = new JPanel();

  /**
   * Sets default properties for OSP.
   */
  static {
    //java.util.Locale.setDefault(new java.util.Locale("es"));  // test of language resources
    JFrame.setDefaultLookAndFeelDecorated(DEFAULT_LOOK_AND_FEEL);
    JDialog.setDefaultLookAndFeelDecorated(DEFAULT_LOOK_AND_FEEL);
    // sets the default directory for the chooser
    try { // system properties may not be readable in some contexts
      chooserDir = System.getProperty("user.dir", null);
    } catch(SecurityException ex) {
      chooserDir = null;
    }
  }

  /**
   * Gets Locales for langauges that have properties files in the core library.
   * @return Locale[]
   */
  public static Locale[] getDefaultLocales() {
    return defaultLocales;
  }

  /**
   * Sets the authorMode property.
   * AuthorMode allows users to author internal parameters such as Locale strings.
   *
   * @param b boolean
   */
  public static void setAuthorMode(boolean b) {
    authorMode = b;
  }

  /**
   * Gets the authorMode property.
   * AuthorMode allows users to author internal parameters such as Locale strings.
   *
   * @return boolean
   */
  public static boolean isAuthorMode() {
    return authorMode;
  }

  /**
   * Sets the launcherMode property.
   * LauncherMode disables access to propertes, such as Locale, that affect the VM.
   *
   * @param b boolean
   */
  public static void setLauncherMode(boolean b) {
    launcherMode = b;
  }

  /**
   * Gets the launcherMode property.
   * LauncherMode disables access to propertes, such as Locale, that affect the VM.
   *
   * @return boolean
   */
  public static boolean isLauncherMode() {
    return launcherMode;
  }

  /**
   * OSPFrame constructor with a title.
   */
  public OSPFrame(String title) {
    super(GUIUtils.parseTeX(title));
    if(appletMode) {
      keepHidden = true;
    }
    buttonPanel.setVisible(false);
    setLocation(topx, topy);
    Dimension d = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
    topx = Math.min(topx+20, (int) d.getWidth()-100);
    topy = Math.min(topy+20, (int) d.getHeight()-100);
    setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);
    // Changes font size to current level
    setFontLevel(FontSizer.getLevel());
    FontSizer.addPropertyChangeListener("level", new PropertyChangeListener() {

      public void propertyChange(PropertyChangeEvent e) {
        int level = ((Integer) e.getNewValue()).intValue();
        setFontLevel(level);
      }
    });
    ToolsRes.addPropertyChangeListener("locale", new PropertyChangeListener() {

      public void propertyChange(PropertyChangeEvent e) {
        refreshGUI();
      }
    });
    setIconImage(ResourceLoader.getImage(osp_icon_file));
  }

  /**
   * OSPFrame constructor.
   */
  public OSPFrame() {
    this("Open Source Physics");
  }

  /**
   * OSPFrame constructor with a new content pane.
   */
  public OSPFrame(Container contentPane) {
    this();
    setContentPane(contentPane);
  }

  /**
   * Sets the title for this frame to the specified string after converting TeX math symbols to characters.
   * @param title the title to be displayed in the frame's border.
   *              A <code>null</code> value
   *              is treated as an empty string, "".
   * @see      #getTitle
   */
  public void setTitle(String title) {
    super.setTitle(GUIUtils.parseTeX(title));
  }

  /**
   * Gets the ICONIFIED flag for this frame.
   *
   * @return boolean true if frame is iconified; false otherwise
   */
  public boolean isIconified() {
    return(getExtendedState()&ICONIFIED)==1;
  }

  /**
   * Invalidates image buffers if a drawing panel is buffered.
   */
  public void invalidateImage() {
    // default does nothing
  }

  /**
   * Sets the font level.
   *
   * @param level the level
   */
  protected void setFontLevel(int level) {
    FontSizer.setFonts(getJMenuBar(), level);
    FontSizer.setFonts(getContentPane(), level);
  }

  /**
   * Reads the animated property.
   *
   * @return boolean
   */
  public boolean isAnimated() {
    return animated;
  }

  /**
   * Sets the animated property.
   *
   * @param animated
   */
  public void setAnimated(boolean animated) {
    this.animated = animated;
  }

  /**
   * Reads the animated property.
   *
   * @return boolean
   */
  public boolean isAutoclear() {
    return autoclear;
  }

  /**
   * Sets the autoclear property.
   *
   * @param autoclear
   */
  public void setAutoclear(boolean autoclear) {
    this.autoclear = autoclear;
  }

  /**
   * Adds a Display menu to the menu bar.
   *
   * The default method does nothing.
   * Override this method to create a menu item that is appropriate for the frame.
   */
  protected JMenu loadDisplayMenu() {
    return null;
  }

  /**
   * Adds a Tools menu to the menu bar.
   *
   * The default method does nothing.
   * Override this method to create a menu item that is appropriate for the frame.
   */
  protected JMenu loadToolsMenu() {
    return null;
  }

  /**
   * Clears data from drawing objects within this frame.
   *
   * The default method does nothing.
   * Override this method to select the object(s) and the data to be cleared.
   */
  public void clearData() {}

  /**
   * Clears data and repaints the drawing panel within this frame.
   *
   * The default method does nothing.
   * Override this method to clear and repaint objects that have data.
   */
  public void clearDataAndRepaint() {}

  public void setSize(int width, int height) {
    super.setSize(width, height);
    validate();
  }

  /**
   * Shows the frame on the screen if the keep hidden flag is false.
   *
   * @deprecated
   */
  public void show() {
    if(!keepHidden) {
      super.show();
    }
  }

  public void dispose() {
    keepHidden = true;
    super.dispose();
  }

  /**
   * Shows or hides this component depending on the value of parameter
   * <code>b</code> and the <code>keepHidden</code> flag.
   *
   * OSP Applets often keep windows hidden.
   *
   * @param b
   */
  public void setVisible(boolean b) {
    if(!keepHidden) {
      boolean shouldRender = (!isVisible())&&animated; // render animated frames when made visible
      super.setVisible(b);
      if(shouldRender) {
        render();
      }
    }
  }

  /**
   * Sets the keepHidden flag.
   *
   * @param _keepHidden
   */
  public void setKeepHidden(boolean _keepHidden) {
    keepHidden = _keepHidden;
    if(keepHidden) {
      super.setVisible(false);
    }
  }

  /**
   * Reads the keepHidden flag.
   *
   */
  public boolean isKeepHidden() {
    return keepHidden;
  }

  /**
   * Gets the ThreadGroup that constructed this frame.
   *
   * @return the ThreadGroup
   */
  public ThreadGroup getConstructorThreadGroup() {
    return constructorThreadGroup;
  }

  /**
   * Creates a BufferStrategy based on the capabilites of the hardware.
   */
  public void createBufferStrategy() {
    createBufferStrategy(2);
    strategy = this.getBufferStrategy();
  }

  /**
   * Shows (repaints) the frame useing the current BufferStrategy.
   */
  public void bufferStrategyShow() {
    if((strategy)==null) {
      createBufferStrategy();
    }
    if(isIconified()||!isShowing()) {
      return;
    }
    Graphics g = strategy.getDrawGraphics();
    paintComponents(g);
    g.dispose();
    strategy.show();
  }

  /**
   * Renders the frame.  Subclass this method to render the contents of this frame in the calling thread.
   */
  public void render() {}

  /**
   * Gets a menu with the given name from the menu bar.  Returns null if menu item does not exist.
   *
   * @param menuName String
   * @return JMenu
   */
  public JMenu getMenu(String menuName) {
    JMenuBar menuBar = getJMenuBar();
    if(menuBar==null) {
      return null;
    }
    menuName = menuName.trim();
    JMenu menu = null;
    for(int i = 0; i<menuBar.getMenuCount(); i++) {
      JMenu next = menuBar.getMenu(i);
      if(next.getText().trim().equals(menuName)) {
        menu = next;
        break;
      }
    }
    return menu;
  }

  /**
   * Removes a menu with the given name from the menu bar and returns the removed item.
   * Returns null if menu item does not exist.
   *
   * @param menuName String
   * @return JMenu
   */
  public JMenu removeMenu(String menuName) {
    JMenuBar menuBar = getJMenuBar();
    if(menuBar==null) {
      return null;
    }
    menuName = menuName.trim();
    JMenu menu = null;
    for(int i = 0; i<menuBar.getMenuCount(); i++) {
      JMenu next = menuBar.getMenu(i);
      if(next.getText().trim().equals(menuName)) {
        menu = next;
        menuBar.remove(i);
        break;
      }
    }
    return menu;
  }

  /**
   * Removes a menu item with the given name from the menu bar and returns the removed item.
   * Returns null if menu item does not exist.
   *
   * @param menuName String
   * @return JMenu
   */
  public JMenuItem removeMenuItem(String menuName, String itemName) {
    JMenu menu = getMenu(menuName);
    if(menu==null) {
      return null;
    }
    itemName = itemName.trim();
    JMenuItem item = null;
    for(int i = 0; i<menu.getItemCount(); i++) {
      JMenuItem next = menu.getItem(i);
      if(next.getText().trim().equals(itemName)) {
        item = next;
        menu.remove(i);
        break;
      }
    }
    return item;
  }

  /**
   * Creates a menu in the menu bar from the given XML document.
   * @param xmlMenu name of the xml file with menu data
   */
  public void parseXMLMenu(String xmlMenu) {
    parseXMLMenu(xmlMenu, null);
  }

  /**
   * Creates a menu in the menu bar from the given XML document.
   * @param xmlMenu name of the xml file with menu data
   * @param type the class to load the menu, may be null
   */
  public void parseXMLMenu(String xmlMenu, Class type) {
    XMLControl xml = null;
    if(type!=null) {
      org.opensourcephysics.tools.Resource res = org.opensourcephysics.tools.ResourceLoader.getResource(xmlMenu, type);
      if(res!=null) {
        xml = new XMLControlElement(res.getString());
      }
    }
    if(xml==null) {
      xml = new XMLControlElement(xmlMenu);
    }
    if(xml.failedToRead()) {
      OSPLog.info("Menu not found: "+xmlMenu);
    } else {
      type = xml.getObjectClass();
      if((type!=null)&&org.opensourcephysics.tools.LaunchNode.class.isAssignableFrom(type)) {
        // load the xml data into a launch node and add the menu item
        org.opensourcephysics.tools.LaunchNode node = (org.opensourcephysics.tools.LaunchNode) xml.loadObject(null);
        JMenuBar menuBar = getJMenuBar();
        if(menuBar==null) {
          return;
        }
        // get the menu name and create the menu if null
        String menuName = node.toString();
        JMenu menu = getMenu(menuName);
        if(menu==null) {
          menu = new JMenu(menuName);
          menuBar.add(menu);
          menuBar.validate();
        }
        // add the node item to the menu
        node.addMenuItemsTo(menu);
        OSPLog.finest("Menu loaded: "+xmlMenu);
      }
    }
  }

  private static boolean isVista(){
     System.out.println(System.getProperty("os.name", ""));
     if (System.getProperty("os.name", "").toLowerCase().indexOf(" vista") > -1) return true;
     return false;
  }

  /**
   * Gets a file chooser.
   *
   * The choose is static and will therefore be the same for all OSPFrames.
   *
   * @return the chooser
   */
  public static JFileChooser getChooser() {
    if(chooser!=null) {
      return chooser;
    }
    try{
      chooser = (chooserDir == null)
          ? new JFileChooser()
          : new JFileChooser(new File(chooserDir));
    }catch(Exception e){
      System.err.println("Exception in OSPFrame getChooser="+e);
      return null;
    }
    javax.swing.filechooser.FileFilter defaultFilter = chooser.getFileFilter();
    javax.swing.filechooser.FileFilter xmlFilter = new javax.swing.filechooser.FileFilter() {

      // accept all directories and *.xml files.
      public boolean accept(File f) {
        if(f==null) {
          return false;
        }
        if(f.isDirectory()) {
          return true;
        }
        String extension = null;
        String name = f.getName();
        int i = name.lastIndexOf('.');
        if((i>0)&&(i<name.length()-1)) {
          extension = name.substring(i+1).toLowerCase();
        }
        if((extension!=null)&&(extension.equals("xml"))) {
          return true;
        }
        return false;
      }

      // the description of this filter
      public String getDescription() {
        return "XML files";
      }
    };
    javax.swing.filechooser.FileFilter txtFilter = new javax.swing.filechooser.FileFilter() {

      // accept all directories and *.txt files.
      public boolean accept(File f) {
        if(f==null) {
          return false;
        }
        if(f.isDirectory()) {
          return true;
        }
        String extension = null;
        String name = f.getName();
        int i = name.lastIndexOf('.');
        if((i>0)&&(i<name.length()-1)) {
          extension = name.substring(i+1).toLowerCase();
        }
        if((extension!=null)&&extension.equals("txt")) {
          return true;
        }
        return false;
      }

      // the description of this filter
      public String getDescription() {
        return "TXT files";
      }
    };
    chooser.addChoosableFileFilter(xmlFilter);
    chooser.addChoosableFileFilter(txtFilter);
    chooser.setFileFilter(defaultFilter);
    return chooser;
  }

  /**
   * Draws the panel into a graphics object suitable for printing.
   * @param g
   * @param pageFormat
   * @param pageIndex
   * @return status code
   * @exception PrinterException
   */
  public int print(Graphics g, PageFormat pageFormat, int pageIndex) throws PrinterException {
    if(pageIndex>=1) { // only one page available
      return Printable.NO_SUCH_PAGE;
    }
    if(g==null) {
      return Printable.NO_SUCH_PAGE;
    }
    Graphics2D g2 = (Graphics2D) g;
    double scalex = pageFormat.getImageableWidth()/(double) getWidth();
    double scaley = pageFormat.getImageableHeight()/(double) getHeight();
    double scale = Math.min(scalex, scaley);
    g2.translate((int) pageFormat.getImageableX(), (int) pageFormat.getImageableY());
    g2.scale(scale, scale);
    paintAll(g2);
    return Printable.PAGE_EXISTS;
  }

  /**
   * Refreshes the user interface in response to display changes such as Language.
   */
  protected void refreshGUI() {
    Iterator it = customButtons.iterator();
    while(it.hasNext()) {
      TranslatableButton b = (TranslatableButton) it.next();
      b.refreshGUI();
    }
    buttonPanel.validate();
  }

  /**
   *  Adds a custom button to the control's frame.
   *
   * @param  methodName   the name of the method; the method has no parameters
   * @param  text         the button's text label
   * @param  toolTipText  the button's tool tip text
   * @param  target       the target for the method
   * @return              the custom button
   */
  public JButton addButton(String methodName, String text, String toolTipText, final Object target) {
    TranslatableButton b = new TranslatableButton(text, toolTipText, target);
    text = TranslatorTool.getProperty(target.getClass(), "custom_button."+text, text);
    b.setText(text);
    toolTipText = TranslatorTool.getProperty(target.getClass(), "custom_button."+toolTipText, toolTipText);
    b.setToolTipText(toolTipText);
    Class[] parameters = {};
    try {
      final java.lang.reflect.Method m = target.getClass().getMethod(methodName, parameters);
      b.addActionListener(new ActionListener() {

        public void actionPerformed(ActionEvent e) {
          Object[] args = {};
          try {
            m.invoke(target, args);
          } catch(IllegalAccessException iae) {
            System.err.println(iae);
          } catch(java.lang.reflect.InvocationTargetException ite) {
            System.err.println(ite);
          }
        }
      });
      buttonPanel.setVisible(true);
      buttonPanel.add(b);
      validate();
      pack();
    } catch(NoSuchMethodException nsme) {
      System.err.println("Error adding custom button "+text+". The method "+methodName+"() does not exist.");
    }
    customButtons.add(b);
    return b;
  }

  class TranslatableButton extends JButton {

    String text, tip;
    Object target;
    public TranslatableButton(String text, String tip, Object target) {
      this.text = text;
      this.tip = tip;
      this.target = target;
    }

    void refreshGUI() {
      setText(TranslatorTool.getProperty(target.getClass(), "custom_button."+text, text));
      setToolTipText(TranslatorTool.getProperty(target.getClass(), "custom_button."+tip, tip));
    }
  }

  /**
   * Overrides JFrame method. This converts EXIT_ON_CLOSE to DISPOSE_ON_CLOSE
   * and sets the wishesToExit flag.
   *
   * @param  operation the operation
   */
  public void setDefaultCloseOperation(int operation) {
    if((operation==JFrame.EXIT_ON_CLOSE)&&OSPParameters.launchingInSingleVM) {
      operation = JFrame.DISPOSE_ON_CLOSE;
      wishesToExit = true;
    }
    super.setDefaultCloseOperation(operation);
  }

  /**
   * Returns true if this frame wishes to exit.
   * Launcher uses this to identify control frames.
   *
   * @return true if this frame wishes to exit
   */
  public boolean wishesToExit() {
    return wishesToExit;
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
