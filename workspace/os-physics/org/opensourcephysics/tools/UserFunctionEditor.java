/*
 * Open Source Physics software is free software as described near the bottom of this code file.
 *
 * For additional information and documentation on Open Source Physics please see:
 * <http://www.opensourcephysics.org/>
 */

package org.opensourcephysics.tools;

import java.awt.*;
import java.awt.event.*;
import java.beans.*;

import javax.swing.*;

import org.opensourcephysics.controls.*;
import org.opensourcephysics.numerics.*;

/**
 * A dialog for editing user functions. 
 * 
 * @author Douglas Brown
 */
public class UserFunctionEditor extends JDialog 
		implements PropertyChangeListener {
	
	final static Color LIGHT_RED = new Color(255, 127, 127);
	final static Color LIGHT_MAGENTA = new Color(255, 153, 204);

	protected ParameterPanel paramPanel;
	protected UserFunction function;
	protected XMLTable table;
	protected boolean approved;
	protected boolean deleted;

	/**
	 * Constructor.
	 * 
	 * @param f the user function to edit
	 */
	public UserFunctionEditor(UserFunction f) {
		super((JFrame)null, true); // modal
		function = f;
		setTitle(ToolsRes.getString("UserFunctionEditor.Title")  //$NON-NLS-1$ 
						+ " \"" + f.getName() + "\""); //$NON-NLS-1$ //$NON-NLS-2$
		paramPanel = new ParameterPanel();
		paramPanel.addPropertyChangeListener("parameter", this); //$NON-NLS-1$
		paramPanel.getTable().addMouseListener(new MouseAdapter() {
      public void mousePressed(MouseEvent e) {
      	AbstractCellEditor editor = (AbstractCellEditor)table.getCellEditor();
      	if (editor != null) editor.stopCellEditing();
      }
    });
		for (int i = 0; i < f.getParameterCount(); i++) {
			paramPanel.addParameter(new Parameter(
					f.getParameterName(i), String.valueOf(f.getParameterValue(i))));
		}
		// put vertical box in CENTER with parameter table
		Box box = Box.createVerticalBox();
		getContentPane().add(box, BorderLayout.CENTER);
		box.add(paramPanel);
		// add titled border to paramPanel
		paramPanel.setBorder(BorderFactory.createTitledBorder(
						ToolsRes.getString("UserFunctionEditor.Parameter.Border.Title"))); //$NON-NLS-1$
    // make new panel with XMLTable in scroller
    XMLControlElement control = new XMLControlElement();
    control.setValue(f.getName(), f.getExpression());
    table = new OSPControlTable(control);
    table.setEditable(true);
    table.addPropertyChangeListener("tableData", this); //$NON-NLS-1$
    table.addMouseListener(new MouseAdapter() {
      public void mousePressed(MouseEvent e) {
      	AbstractCellEditor editor = 
      		(AbstractCellEditor)paramPanel.getTable().getCellEditor();
      	if (editor != null) editor.stopCellEditing();
      }
    });
		JScrollPane scroller = new JScrollPane(table);
		scroller.createHorizontalScrollBar();
		JPanel xmlPanel = new JPanel(new BorderLayout()) {
			// override getPreferredSize to report table size
			public Dimension getPreferredSize() {
				Dimension dim = table.getPreferredSize();
				return dim;
			}	
		};
		xmlPanel.add(scroller, BorderLayout.CENTER);
		// add titled border to xmlPanel
		xmlPanel.setBorder(BorderFactory.createTitledBorder(
				ToolsRes.getString("UserFunctionEditor.Function.Border.Title") //$NON-NLS-1$
				+ " ("+f.getIndependentVariable()+")")); //$NON-NLS-1$ //$NON-NLS-2$
		box.add(xmlPanel);
		// put buttonBar in SOUTH position
		JPanel buttonBar = new JPanel(new FlowLayout());
		getContentPane().add(buttonBar, BorderLayout.SOUTH);
		// delete button
		JButton deleteButton = new JButton(ToolsRes.getString("UserFunctionEditor.Button.Delete")); //$NON-NLS-1$
		buttonBar.add(deleteButton);
		deleteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				deleted = true;
				setVisible(false);
			}
		});
		// OK button
		JButton okButton = new JButton(ToolsRes.getString("UserFunctionEditor.Button.OK")); //$NON-NLS-1$
		buttonBar.add(okButton);
		okButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// set user function parameters
				function.setParameters(paramPanel.getNames(), paramPanel.getValues());
				// set user function equation
				XMLControl control = table.getControl();
				String eqn = control.getString(function.getName());
				function.setExpression(eqn, function.getIndependentVariable());
				approved = true;
				setVisible(false);
			}
		});
		// cancel button
		JButton cancelButton = new JButton(ToolsRes.getString("UserFunctionEditor.Button.Cancel")); //$NON-NLS-1$
		buttonBar.add(cancelButton);
		cancelButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				approved = false;
				setVisible(false);
			}
		});
		setSize(280, 280);
    Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
    int x = (dim.width - getBounds().width) / 2;
    int y = (dim.height - getBounds().height) / 2;
    setLocation(x, y);
	}
	
	/**
	 * Returns true if the user has approved changes.
	 * 
	 * @return true if approved, false if cancelled
	 */
	public boolean isApproved() {
		return approved;
	}
	
	/**
	 * Returns true if the user has deleted the user function.
	 * 
	 * @return true if deleted
	 */
	public boolean isDeleted() {
		return deleted;
	}
	
	/**
	 * Responds to property change events.
	 * 
	 * @param e the property change event
	 */
	public void propertyChange(PropertyChangeEvent e) {
		// check equation for errors
		String eqn = table.getControl().getString(function.getName());		
		// try to parse equation
		eqn = eqn.replaceAll(function.getIndependentVariable(), "dummy"); //$NON-NLS-1$
		String[] params = paramPanel.getNames();
		String[] names = new String[params.length+1];
		names[0] = "dummy"; //$NON-NLS-1$
		System.arraycopy(params, 0, names, 1, params.length);
		boolean error = eqn.indexOf("=") > -1; //$NON-NLS-1$
		try {
			new ParsedMultiVarFunction(eqn, names);
		}
		catch (ParserException ex) {error = true;}
		if (error) {
			table.setBackgroundColor(function.getName(), LIGHT_RED);
			table.setSelectedColor(function.getName(), LIGHT_MAGENTA);
		}
		else {
			table.setBackgroundColor(function.getName(), null);
			table.setSelectedColor(function.getName(), null);
		}
		table.repaint();
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
