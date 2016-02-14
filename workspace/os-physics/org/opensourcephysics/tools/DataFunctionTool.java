/*
 * Open Source Physics software is free software as described near the bottom of this code file.
 *
 * For additional information and documentation on Open Source Physics please see:
 * <http://www.opensourcephysics.org/>
 */

package org.opensourcephysics.tools;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.beans.*;

import javax.swing.*;

import org.opensourcephysics.display.*;

/**
 * This tool allows users to create DataFunctions.
 *
 * @author Douglas Brown
 */
public class DataFunctionTool extends JDialog {

  // static fields
  private static Dimension dim = new Dimension(320, 300);
	private static TextFrame helpFrame;
	
  
  // instance fields
  Map panels = new TreeMap();
  JPanel contentPane = new JPanel(new BorderLayout());
  JPanel noData;
  JComboBox dropdown;
  JPanel north = new JPanel(new BorderLayout());
  boolean refreshing;
  DataFunctionPanel selectedPanel;
  JButton helpButton;
  JButton closeButton;
  JPanel buttonbar = new JPanel(new FlowLayout(FlowLayout.TRAILING));
  
  public DataFunctionTool(Component comp) {
  	super(JOptionPane.getFrameForComponent(comp), false);
		if (comp instanceof PropertyChangeListener) {
			PropertyChangeListener listener = (PropertyChangeListener)comp;
    	addPropertyChangeListener("variable", listener); //$NON-NLS-1$
    	addPropertyChangeListener("data", listener); //$NON-NLS-1$
    	addPropertyChangeListener("visible", listener); //$NON-NLS-1$
		}
    setName("DataFunctionTool"); //$NON-NLS-1$
    createGUI();
    refreshGUI();
  }

  /**
   * Adds a DatasetManager.
   *
   * @param name a descriptive name
   * @param data the DatasetManager
   */
  public void addData(String name, DatasetManager data) {
  	DataFunctionPanel panel = new DataFunctionPanel(data, this);
  	panel.setPreferredSize(dim);
  	panels.put(name, panel);
  	refreshing = true;
  	dropdown.addItem(name);
  	refreshing = false;
  	if (selectedPanel == null) setSelectedData(name);
  }

  /**
   * Removes a named DatasetManager.
   *
   * @param name the name
   */
  public void removeData(String name) {
  	DataFunctionPanel panel = (DataFunctionPanel)panels.get(name);
  	if (panel != null) {
  		panels.remove(name);
    	refreshing = true;
    	dropdown.removeItem(name);
    	refreshing = false;
  	}
  	if (panels.isEmpty()) {
  		select(null);
  	}
  	else {
  		setSelectedData((String)dropdown.getItemAt(0));
  	}
  }

  /**
   * Selects a DatasetManager by name.
   *
   * @param name the name
   */
  public void setSelectedData(String name) {
  	dropdown.setSelectedItem(name);
  }

  /**
   * Returns the name of the selected DatasetManager.
   *
   * @return the name
   */
  public String getSelectedDataName() {
  	Component c = contentPane.getComponent(1);
  	if (c instanceof DataFunctionPanel) {
  		DataFunctionPanel panel = (DataFunctionPanel)c;
  		Iterator it = panels.keySet().iterator();
  		while (it.hasNext()) {
  			String name = (String)it.next();
  			if (panels.get(name) == panel) return name;
  		}
  	}
  	return null;
  }

  /**
   * Renames a DatasetManager.
   *
   * @return the name
   */
  public void renameData(String prevName, String newName) {
  	String selected = getSelectedDataName();
  	DataFunctionPanel panel = (DataFunctionPanel)panels.get(prevName);
  	if (panel != null) {
    	refreshing = true;
  		panels.remove(prevName);
  		panels.put(newName, panel);
  		dropdown.removeItem(prevName);
  		dropdown.addItem(newName);
  		if (prevName.equals(selected))
  			dropdown.setSelectedItem(newName);
  		panel.refreshGUI();
    	refreshing = false;
  	}
  }

  /**
   * Clears all DatasetManagers.
   */
  public void clearData() {
  	refreshing = true;
  	panels.clear();
  	dropdown.removeAllItems();
  	select(null);
  	refreshing = false;
  }

  /**
   * Overrides JDialog setVisible method.
   *
   * @param vis true to show this inspector
   */
  public void setVisible(boolean vis) {
    super.setVisible(vis);
    firePropertyChange("visible", null, new Boolean(vis)); //$NON-NLS-1$
  }

  /**
   * Fires a property change. This makes this method visible to the tools package.
   */
  protected void firePropertyChange(String name, Object oldObj, Object newObj) {
    super.firePropertyChange(name, oldObj, newObj);
  }

  /**
   * Creates the GUI.
   */
  private void createGUI() {
     // listen to ToolsRes for locale changes
     ToolsRes.addPropertyChangeListener("locale", new PropertyChangeListener() { //$NON-NLS-1$
       public void propertyChange(PropertyChangeEvent e) {
         refreshGUI();
       }
     });
     // configure the dialog
     setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);
   	 setResizable(false);
   	 // create the noData panel
   	 noData = new JPanel();
   	 JLabel label = new JLabel(ToolsRes.getString("DataFunctionTool.Message.NoData")); //$NON-NLS-1$
   	 noData.add(label);
   	 // create the dropdown
   	 dropdown = new JComboBox();
   	 north.add(dropdown, BorderLayout.NORTH);
   	 north.setBorder(BorderFactory.createEmptyBorder(2,2,2,2));
     // add listener to select data by name
     dropdown.addActionListener(new ActionListener() {
       public void actionPerformed(ActionEvent e) {
         if (refreshing) return;
         String name = (String)dropdown.getSelectedItem();
         select(name);
       }
     });
     // create buttons
     closeButton = new JButton();
     closeButton.addActionListener(new ActionListener() {
       public void actionPerformed(ActionEvent e) {
         setVisible(false);
       }
     });
     helpButton = new JButton();
     helpButton.addActionListener(new ActionListener() {
       public void actionPerformed(ActionEvent e) {
         if (helpFrame == null) {
           String htmlFile = "/org/opensourcephysics/resources/tools/html/datafunction_tool_help.html"; //$NON-NLS-1$
           helpFrame = new TextFrame(htmlFile);
           helpFrame.setSize(600, 500);
           // center on the screen
           Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
           int x = (dim.width-helpFrame.getBounds().width)/2;
           int y = (dim.height-helpFrame.getBounds().height)/2;
           helpFrame.setLocation(x, y);
         }
         helpFrame.setVisible(true);
       }
     });
     buttonbar.add(helpButton);
     buttonbar.add(closeButton);
   	 contentPane.setPreferredSize(dim);
     contentPane.add(noData, BorderLayout.CENTER);
     contentPane.add(buttonbar, BorderLayout.SOUTH);
   	 setContentPane(contentPane);
   	 pack();
     // center this on the screen
     Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
     int x = (dim.width-getBounds().width)/2;
     int y = (dim.height-getBounds().height)/2;
     setLocation(x, y);
  }
  
  /**
   * Refreshes the GUI.
   */
  private void refreshGUI() {
    setTitle(ToolsRes.getString("DataFunctionTool.Title")); //$NON-NLS-1$
    closeButton.setText(ToolsRes.getString("Tool.Button.Close"));               //$NON-NLS-1$
    closeButton.setToolTipText(ToolsRes.getString("Tool.Button.Close.ToolTip"));//$NON-NLS-1$
    helpButton.setText(ToolsRes.getString("Tool.Button.Help"));                 //$NON-NLS-1$
    helpButton.setToolTipText(ToolsRes.getString("Tool.Button.Help.ToolTip"));  //$NON-NLS-1$
    Iterator it = panels.values().iterator();
    while (it.hasNext()) {
    	DataFunctionPanel panel = (DataFunctionPanel)it.next();
      panel.refreshGUI();
    }
  }
  
  /**
   * Refreshes the GUI.
   */
  private void select(String name) {
  	DataFunctionPanel panel = (DataFunctionPanel)panels.get(name);
	if (selectedPanel != null) contentPane.remove(selectedPanel);
	else contentPane.remove(noData);
  	if (panel != null) {
  		contentPane.add(panel, BorderLayout.CENTER);
  		contentPane.add(north, BorderLayout.NORTH);
  		panel.refreshGUI();
  	}
  	else {
  		contentPane.add(noData, BorderLayout.CENTER);
  		contentPane.remove(north);
  		buttonbar.removeAll();
      buttonbar.add(helpButton);
      buttonbar.add(closeButton);
  	}
  	selectedPanel = panel;
  	validate();
  	repaint();
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
