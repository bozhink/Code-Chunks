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

import javax.swing.*;
import javax.swing.table.*;
import javax.swing.undo.*;

/**
 * This is a JPanel containing a JTable of user-defined parameters
 * and buttons to add and remove parameters.
 *
 * @author Douglas Brown
 */
public class ParameterPanel extends JPanel {

  // static constants
	final static Color LIGHT_BLUE = new Color(204, 204, 255);
	final static Color LIGHT_RED = new Color(255, 127, 127);
	final static Color LIGHT_MAGENTA = new Color(255, 153, 204);
	final static Color LIGHT_GRAY = javax.swing.UIManager.getColor("Panel.background"); //$NON-NLS-1$

  // instance fields
	protected ArrayList parameters = new ArrayList();
	protected Parameter[] prevParameters;
	protected String[] paramNames = new String[0];
	protected double[] paramValues = new double[0];
	protected ParamTableModel paramModel = new ParamTableModel();
	protected ParamTable paramTable;
	protected ParamCellEditor paramEditor = new ParamCellEditor();
	protected ParamCellRenderer paramRenderer = new ParamCellRenderer();
	protected int id = 0; // counter to make unique default param names
	protected JButton newButton;
	protected JButton deleteButton;
	protected JScrollPane paramScroller;
	protected JPanel buttonPanel;
	
	/**
	 * Constructor
	 */
  public ParameterPanel() {
  	super(new BorderLayout());
    createGUI();
    refreshGUI();
  }

	/**
	 * Gets the parameter table.
	 * 
	 * @return the table
	 */
	public JTable getTable() {
		return paramTable;
	}

	/**
	 * Override getPreferredSize().
	 * 
	 * @return the table size plus button height
	 */
	public Dimension getPreferredSize() {
		Dimension dim = paramTable.getPreferredSize();
		dim.height += buttonPanel.getPreferredSize().height;
		return dim;
	}
	
	/**
	 * Replaces the current parameters with new ones.
	 * 
	 * @param params an array of Parameters
	 */
	public void setParameters(Parameter[] params) {
		parameters.clear();
		for (int i = 0; i < params.length; i++ ) {
			parameters.add(params[i]);
		}
		evaluateAll();
		paramModel.fireTableStructureChanged();
		deleteButton.setEnabled(canDelete());
	}
	
	/**
	 * Gets a copy of the current parameters.
	 * 
	 * @return an array of Parameters
	 */
	public Parameter[] getParameters() {
		Parameter[] params = new Parameter[parameters.size()];
		for (int i = 0; i < parameters.size(); i++) {
			Parameter next = (Parameter)parameters.get(i);
			params[i] = new Parameter(next.paramName, next.funcStr);
			params[i].setEditable(next.isEditable());
			params[i].value = next.value;
		}
		return params;
	}

	/**
	 * Adds a parameter to the parameters.
	 * 
	 * @param param the parameter
	 */
	public void addParameter(Parameter param) {
		Parameter[] params = new Parameter[parameters.size()+1];
		int i = 0;
		for (; i < parameters.size(); i++) {
			Parameter next = (Parameter)parameters.get(i);
			params[i] = new Parameter(next.paramName, next.funcStr);
			params[i].setEditable(next.isEditable());
			params[i].value = next.value;
		}
		params[i] = param;
		setParameters(params);
	}

	/**
	 * Replaces a parameter with a new one.
	 * 
	 * @param param the new parameter
	 * @return the old parameter, or null if none found
	 */
	public Parameter replaceParameter(Parameter param) {
		for (int i = 0; i < parameters.size(); i++) {
			Parameter next = (Parameter)parameters.get(i);
			if (next.getName().equals(param.getName())) {
				parameters.remove(next);
				parameters.add(i, param);
				evaluateAll();
				paramModel.fireTableStructureChanged();
				return next;
			}
		}
		return null;
	}

	/**
	 * Gets the current parameter names.
	 * 
	 * @return an array of names
	 */
	public String[] getNames() {
		return paramNames;
	}

	/**
	 * Gets the current parameter values.
	 * 
	 * @return an array of names
	 */
	public double[] getValues() {
		return paramValues;
	}

	/**
	 * Evaluates all current parameters.
	 */
	public void evaluateAll() {
		paramNames = new String[parameters.size()];
		paramValues = new double[parameters.size()];
		for (int i = 0; i < parameters.size(); i++) {
			Parameter p = (Parameter)parameters.get(i);
			p.evaluate(parameters);
			paramNames[i] = p.getName();
			paramValues[i] = p.getValue();
		}
	}

	/**
	 * Refreshes button strings based on current locale.
	 */
	public void refreshStrings() {
		refreshGUI();
	}

  /**
   * Creates the GUI.
   */
  protected void createGUI() {
		// create parameter table and scroller
		paramTable = new ParamTable(paramModel);
		paramScroller = new JScrollPane(paramTable);
		paramScroller.createHorizontalScrollBar();
		add(paramScroller, BorderLayout.CENTER);
		buttonPanel = new JPanel(new FlowLayout());
		newButton = new JButton(ToolsRes.getString("ParameterPanel.Button.NewParameter")); //$NON-NLS-1$
		newButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				int prevRow = paramTable.getSelectedRow();
				int prevCol = paramTable.getSelectedColumn();
				prevParameters = getParameters();
				String defaultName = ToolsRes.getString("ParameterPanel.NewParameter.Name.Default"); //$NON-NLS-1$
				Parameter p = new Parameter(defaultName + id++, "0"); //$NON-NLS-1$
				parameters.add(p);
				evaluateAll();
				paramModel.fireTableStructureChanged();
				deleteButton.setEnabled(true);
				// select new Parameter
				int newRow = parameters.size() - 1;
				// create undoable edit
				ParamEdit edit = new ParamEdit(
								getParameters(), prevParameters, newRow, prevRow, 0, prevCol);
				// select new parameter
				paramTable.setColumnSelectionInterval(0, 0);
				paramTable.setRowSelectionInterval(newRow, newRow);
				paramTable.requestFocusInWindow();
				// pass undoable edit to listeners
				firePropertyChange("parameter", null, edit); //$NON-NLS-1$
			}
		});
		buttonPanel.add(newButton);
		deleteButton = new JButton(ToolsRes.getString("ParameterPanel.Button.DeleteParameter")); //$NON-NLS-1$
		deleteButton.setEnabled(false);
		deleteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				int prevRow = paramTable.getSelectedRow();
				if (prevRow < 0) return;
				// don't delete if the selected parameter is uneditable
				Parameter p = (Parameter)parameters.get(prevRow);
				if (!p.isEditable()) return;
				int prevCol = paramTable.getSelectedColumn();
				prevParameters = getParameters();
				parameters.remove(prevRow);
				evaluateAll();
				paramModel.fireTableStructureChanged();
				deleteButton.setEnabled(canDelete());
				// select new row
				int newRow = (prevRow == parameters.size())? prevRow-1: prevRow;
				if (newRow >= 0) {
					paramTable.setColumnSelectionInterval(0, 0);
					paramTable.setRowSelectionInterval(newRow, newRow);
				}
				// create and pass undoable edit to listeners
				ParamEdit edit = new ParamEdit(
								getParameters(), prevParameters, newRow, prevRow, 0, prevCol);
				firePropertyChange("parameter", null, edit); //$NON-NLS-1$
			}
		});
		buttonPanel.add(deleteButton);
		add(buttonPanel, BorderLayout.SOUTH);
  }
  
  /**
   * Refreshes the GUI.
   */
  protected void refreshGUI() {
		newButton.setText(ToolsRes.getString("ParameterPanel.Button.NewParameter")); //$NON-NLS-1$
		deleteButton.setText(ToolsRes.getString("ParameterPanel.Button.DeleteParameter")); //$NON-NLS-1$
		setBorder(BorderFactory.createTitledBorder(ToolsRes.getString("ParameterPanel.Border.Title"))); //$NON-NLS-1$
		// determine row and column selected
		int row = paramTable.getSelectedRow();
		int col = paramTable.getSelectedColumn();
		paramModel.fireTableStructureChanged();
		// select same cell
		paramTable.changeSelection(row, col, false, false);
  }
  
  /**
   * Returns true if there are any editable parameters.
   */
  protected boolean canDelete() {
		for (Iterator it = parameters.iterator(); it.hasNext();) {
			Parameter p = (Parameter)it.next();
			if (p.isEditable()) return true;
		}
		return false;
  }
  
	/**
	 * A class to undo/redo Parameter changes.
	 */
	protected class ParamEdit extends AbstractUndoableEdit {

		Parameter[] params;
		Parameter[] prev;
		int row, prevRow, col, prevCol;

		// constructor
		public ParamEdit(Parameter[] newParams, Parameter[] prevParams, 
						int newRow, int prevRow, int newCol, int prevCol) {
			params = newParams;
			prev =prevParams;
			row = newRow;
			this.prevRow = prevRow;
			col = newCol;
			this.prevCol = prevCol;
		}

		// undoes the change
		public void undo() throws CannotUndoException {
			super.undo();
			setParameters(prev);
			// select cell and request keyboard focus
			paramTable.changeSelection(prevRow, prevCol, false, false);
			paramTable.requestFocusInWindow();			
			firePropertyChange("parameter", null, null); //$NON-NLS-1$
		}

		// redoes the change
		public void redo() throws CannotUndoException {
			super.redo();
			setParameters(params);
			// select cell and request keyboard focus
			paramTable.changeSelection(row, col, false, false);
			paramTable.requestFocusInWindow();			
			firePropertyChange("parameter", null, null); //$NON-NLS-1$
		}

		// returns the presentation name
		public String getPresentationName() {
			return "User Parameter"; //$NON-NLS-1$
		}
	}

	/**
	 * A table to display Parameters.
	 */
	protected class ParamTable extends JTable {
		
		// constructor
		ParamTable(ParamTableModel model) {
			setModel(model);
			setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
			setColumnSelectionAllowed(true);
			getTableHeader().setReorderingAllowed(false);
			setGridColor(Color.BLACK);
			// make enter key start editing
			InputMap im = getInputMap(JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
			Action enterAction = new AbstractAction() {
				public void actionPerformed(ActionEvent e) {
					// start editing
					JTable table = (JTable)e.getSource();
					int row = table.getSelectedRow();
					int column = table.getSelectedColumn();
					table.editCellAt(row, column, e);
					Component comp = table.getEditorComponent();
					if (comp instanceof JPanel) {
						JPanel panel = (JPanel)comp;
						comp = panel.getComponent(0);
						if (comp instanceof JTextField) {
							JTextField field = (JTextField)comp;
							field.requestFocus();
							field.selectAll();
						}
					}
				}
			};
			KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
			getActionMap().put(im.get(enter), enterAction);
		}

		// overrides JTable method to prevent selecting uneditable cells
		public void changeSelection(int row, int column, boolean toggle, boolean extend) {
			if (row < 0) return;
			Parameter p = (Parameter)parameters.get(row);
			if (p.isEditable())
				super.changeSelection(row, column, toggle, extend);
		}
		
		// gets the cell editor
		public TableCellEditor getCellEditor(int row, int column) {
			return paramEditor;
		}

		// gets the cell renderer
		public TableCellRenderer getCellRenderer(int row, int column) {
			return paramRenderer;
		}
	}

	/**
	 * A table model for the ParamTable.
	 */
	protected class ParamTableModel extends AbstractTableModel {
		
		// returns the number of columns in the table
		public int getColumnCount() {
			return 2;
		}

		// returns the number of rows in the table
		public int getRowCount() {
			return parameters.size();
		}

		// gets the name of the column
		public String getColumnName(int col) {
			return col == 0? 
							ToolsRes.getString("ParameterPanel.Table.Column.Name"):  //$NON-NLS-1$
							ToolsRes.getString("ParameterPanel.Table.Column.Value"); //$NON-NLS-1$
		}

		// gets the value in a cell
		public Object getValueAt(int row, int col) {
			Parameter p = (Parameter)parameters.get(row);
			return col == 0? p.paramName: p.funcStr;
		}

		// changes the value of a cell
		public void setValueAt(Object value, int row, int col) {
			if (value instanceof String) {
				String val = (String)value;
				// save previous parameter values for undos
				prevParameters = getParameters();
				Parameter p = (Parameter)parameters.get(row);
				if (col == 0) { // function name
					if (val.equals(p.paramName)) return;
					// check that name is not already being used
					boolean taken = false;
					Iterator it = parameters.iterator();
					while (it.hasNext()) {
						if (taken) break;
						Parameter next = (Parameter)it.next();
						if (next == p) continue;
						taken = next.paramName.equals(val);
					}
					if (taken) {
						JOptionPane.showMessageDialog(
								null,
								ToolsRes.getString("ParameterPanel.Dialog.DuplicateName.Message"), //$NON-NLS-1$
								ToolsRes.getString("ParameterPanel.Dialog.DuplicateName.Title"), //$NON-NLS-1$
								JOptionPane.WARNING_MESSAGE);
						return;
					}
					parameters.remove(p);
					p = new Parameter(val, p.getFunctionString());
					parameters.add(row, p);
				}
				else { // function string
					if (val.equals(p.funcStr)) return;
					parameters.remove(p);
					p = new Parameter(p.getName(), val);
					parameters.add(row, p);
				}
				evaluateAll();
				paramTable.repaint();
				// create undoable edit
				ParamEdit edit = new ParamEdit(
								getParameters(), prevParameters, row, row, col, col);
				// pass undoable edit to listeners
				firePropertyChange("parameter", null, edit); //$NON-NLS-1$
			}
		}

		// determines if a cell is editable
		public boolean isCellEditable(int row, int col) {
			Parameter p = (Parameter)parameters.get(row);
			return p.isEditable();
		}
	}

	/**
	 * A cell editor for the ParamTable.
	 */
	protected class ParamCellEditor extends AbstractCellEditor implements TableCellEditor {
		JPanel panel = new JPanel(new BorderLayout());
		JTextField field = new JTextField();
		int keepFocus = -2;

		// Constructor.
		ParamCellEditor() {
			panel.add(field, BorderLayout.CENTER);
			panel.setOpaque(false);
			panel.setBorder(BorderFactory.createEmptyBorder(0, 1, 1, 2));
			field.setBorder(null);
			field.setEditable(true);
			field.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					stopCellEditing();
					keepFocus = -2;
				}
			});
			field.addKeyListener(new KeyAdapter() {
				public void keyPressed(KeyEvent e) {
					if (e.getKeyCode() == KeyEvent.VK_ENTER) {
						stopCellEditing();
						keepFocus = -2;
					}
					else {
						field.setBackground(Color.yellow);
					}
				}
			});
			field.addFocusListener(new FocusAdapter() {
				public void focusLost(FocusEvent e) {
					if (field.getBackground() != Color.WHITE) {
						stopCellEditing();
					}
					int i = paramTable.getSelectedRow();
					if (keepFocus == i) {
						keepFocus = -2;
					}
					else paramTable.requestFocusInWindow();
				}
			});
		}

		// Gets the component to be displayed while editing.
		public Component getTableCellEditorComponent(JTable table, Object value,
						boolean isSelected, int row, int column) {
			field.setText(value.toString());
			return panel;
		}

		// Determines when editing starts.
		public boolean isCellEditable(EventObject e) {
			if (e instanceof MouseEvent) {
				MouseEvent me = (MouseEvent)e;
				int row = paramTable.rowAtPoint(me.getPoint());
				keepFocus = row;
				return true;
			}
			else if (e == null || e instanceof ActionEvent) {
				keepFocus = -2;
				return true;
			}
			return false;
		}

		// Called when editing is completed.
		public Object getCellEditorValue() {
			field.setBackground(Color.WHITE);
			return field.getText();
		}
	}

	/**
	 * A cell renderer for the ParamTable.
	 */
	protected class ParamCellRenderer extends DefaultTableCellRenderer {
		Font font = new JTextField().getFont();

		// Constructor
		public ParamCellRenderer() {
			super();
			setOpaque(true); // make background visible
			setFont(font);
			setHorizontalAlignment(SwingConstants.LEFT);
			setBorder(BorderFactory.createEmptyBorder(2, 1, 2, 2));
		}

		// Returns a label for the specified cell.
		public Component getTableCellRendererComponent(JTable table, Object value,
						boolean isSelected, boolean hasFocus, int row, int col) {
			setText(value.toString());
			Parameter p = (Parameter)parameters.get(row);
			if (col == 1 && Double.isNaN(p.value)) { // error condition
				if (isSelected) {
					setForeground(Color.RED);
					setBackground(LIGHT_MAGENTA);
				}
				else {
					setForeground(Color.BLACK);
					setBackground(LIGHT_RED);
				}
			}
			else if (!p.isEditable()) { // uneditable cell
				setForeground(Color.BLACK);
				setBackground(LIGHT_GRAY);
			}
			else if (isSelected) { // selected editable cell
				setForeground(Color.RED);
				setBackground(LIGHT_BLUE);
			}
			else { // unselected editable cell
				setForeground(Color.BLACK);
				setBackground(Color.WHITE);
			}
			return this;
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
