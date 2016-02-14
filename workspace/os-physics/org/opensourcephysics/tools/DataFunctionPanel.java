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
import javax.swing.border.*;
import javax.swing.table.*;

import org.opensourcephysics.display.*;

/**
 * This is a panel for the DataFunctionTool.
 *
 * @author Douglas Brown
 */
public class DataFunctionPanel extends JPanel {

  // static constants
  final static Color LIGHT_BLUE = new Color(204, 204, 255);
  final static Color LIGHT_RED = new Color(255, 102, 102);

  // instance fields
  private DataFunctionTool tool;
	private DatasetManager data;
	private FunctionTableModel model = new FunctionTableModel();
	private FunctionTable table;
	private FunctionCellEditor editor = new FunctionCellEditor();
	private FunctionCellRenderer renderer = new FunctionCellRenderer();
  private JTextArea variables;
  private JScrollPane scroller;
  private ArrayList functions = new ArrayList();
  private JButton newButton;
  private JButton deleteButton;
  private int id = 0;

  public DataFunctionPanel(DatasetManager input, DataFunctionTool tool) {
  	super(new BorderLayout());
  	this.tool = tool;
  	data = input;
    createGUI();
    refreshGUI();
    refreshTable();
    refreshVars(null);
    tool.firePropertyChange("variable", null, null); //$NON-NLS-1$
  }

  /**
   * Creates the GUI.
   */
  private void createGUI() {
     Box box = Box.createVerticalBox();
     add(box, BorderLayout.CENTER);
     variables = new JTextArea();
     variables.setEditable(false);
     variables.setLineWrap(true);     
     variables.setWrapStyleWord(true);
     box.add(variables);
     table = new FunctionTable(model);
     scroller = new JScrollPane(table);
     box.add(scroller);
     // create buttons
     newButton = new JButton();
     newButton.addActionListener(new ActionListener() {
       public void actionPerformed(ActionEvent e) {
       	 DataFunction f = new DataFunction(data);
       	 f.setFunctionName(f.getFunctionName() + id++);
      	 data.addDataset(f);
      	 refreshTable();
      	 refreshVars(f);
      	 // select added DataFunction
      	 int row = functions.size() - 1;
      	 table.setColumnSelectionInterval(0, 0);
      	 table.setRowSelectionInterval(row, row);
      	 tool.firePropertyChange("variable", null, null); //$NON-NLS-1$
       }
     });
     deleteButton = new JButton();
     deleteButton.addActionListener(new ActionListener() {
       public void actionPerformed(ActionEvent e) {
      	 int row = table.getSelectedRow();
      	 if (row < 0) return;
      	 DataFunction f = (DataFunction)functions.get(row);
       	 int index = data.getDatasetIndex(f.getFunctionName());
      	 if (index > -1) {
      		 data.removeDataset(index);
        	 refreshTable();
        	 // select remaining DataFunction, if any
        	 if (row == functions.size()) row--;
        	 if (row >= 0) {
          	 table.setColumnSelectionInterval(0, 0);
          	 table.setRowSelectionInterval(row, row);
        		 f = (DataFunction)functions.get(row);
          	 refreshVars(f);
        	 }
        	 else refreshVars(null);
        	 tool.firePropertyChange("variable", null, null); //$NON-NLS-1$
      	 }
       }
     });
  }
  
  /**
   * Refreshes the GUI.
   */
  protected void refreshGUI() {
    newButton.setText(ToolsRes.getString("DataFunctionPanel.Button.NewFunction")); //$NON-NLS-1$
    newButton.setToolTipText(ToolsRes.getString("DataFunctionPanel.Button.NewFunction.Tooltip")); //$NON-NLS-1$
    deleteButton.setText(ToolsRes.getString("DataFunctionPanel.Button.DeleteFunction")); //$NON-NLS-1$
    deleteButton.setToolTipText(ToolsRes.getString("DataFunctionPanel.Button.DeleteFunction.Tooltip")); //$NON-NLS-1$
    variables.setToolTipText(ToolsRes.getString("DataFunctionPanel.TextArea.Variables.Tooltip")); //$NON-NLS-1$
    tool.buttonbar.removeAll();
    tool.buttonbar.add(newButton);
    tool.buttonbar.add(deleteButton);
    tool.buttonbar.add(tool.helpButton);
    tool.buttonbar.add(tool.closeButton);
    Border space = BorderFactory.createEmptyBorder(0, 4, 6, 4);
    Border title = BorderFactory.createTitledBorder(ToolsRes.getString("DataFunctionPanel.TextArea.Variables.Title")); //$NON-NLS-1$
    variables.setBorder(BorderFactory.createCompoundBorder(title, space));
    space = BorderFactory.createEmptyBorder(0, 4, 4, 4);
    title = BorderFactory.createTitledBorder(ToolsRes.getString("DataFunctionPanel.Table.Functions.Title")); //$NON-NLS-1$
    Border line = BorderFactory.createLineBorder(Color.BLACK);
    space = BorderFactory.createCompoundBorder(space, line);
    scroller.setBorder(BorderFactory.createCompoundBorder(title, space));
    model.fireTableStructureChanged(); // refreshes table header strings?
  	revalidate();
  }
  
  private void refreshTable() {
  	functions.clear();
    Iterator it = data.getDatasets().iterator();
    while (it.hasNext()) {
    	Dataset next = (Dataset)it.next();
    	if (next instanceof DataFunction) {
    		functions.add(next);
    	}
    }
    model.fireTableStructureChanged();
  }

  private void refreshVars(DataFunction f) {
    StringBuffer vars = new StringBuffer();
  	Iterator it = data.getDatasets().iterator();
  	while (it.hasNext()) {
  		Dataset dataset = (Dataset)it.next();
  		if (dataset instanceof DataFunction) continue;
  		if (vars.length() == 0) vars.append(dataset.getXColumnName());
  		vars.append(",   "+dataset.getYColumnName()); //$NON-NLS-1$
  	}
  	Map constants = data.getProperties();
  	it = constants.keySet().iterator();
  	while (it.hasNext()) {
  		String name = (String)it.next();
  		if (constants.get(name) instanceof Double) { 
  			vars.append(",   "+name); //$NON-NLS-1$
  		}
  	}
  	it = functions.iterator();
  	while (it.hasNext()) {
  		DataFunction next = (DataFunction)it.next();
  		if (next != f) { 
  			vars.append(",   "+next.getFunctionName()); //$NON-NLS-1$
  		}
  	}
    variables.setText(vars.toString());
  	revalidate();
  }

  /**
   * A table to display DataFunction properties.
   */
  class FunctionTable extends JTable {
  	FunctionTable(FunctionTableModel model) {
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
          JTable table = (JTable) e.getSource();
          int row = table.getSelectedRow();
          int column = table.getSelectedColumn();
          table.editCellAt(row, column, e);
          Component comp = table.getEditorComponent();
          if(comp instanceof JPanel) {
            JPanel panel = (JPanel) comp;
            comp = panel.getComponent(0);
            if(comp instanceof JTextField) {
              JTextField field = (JTextField) comp;
              field.requestFocus();
              field.selectAll();
            }
          }
        }
      };
      KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
      getActionMap().put(im.get(enter), enterAction);
  	}

  	public TableCellEditor getCellEditor(int row, int column) {
      return editor;
    }
  	
    public TableCellRenderer getCellRenderer(int row, int column) {
      return renderer;
    }
  }
  
  /**
   * A table model for the FunctionTable.
   */
  class FunctionTableModel extends AbstractTableModel {
    public int getColumnCount() {
    	return 2;
    }
    public int getRowCount() {
    	return functions.size();
    }
    public String getColumnName(int col) {
    	return col == 0? ToolsRes.getString("DataFunctionPanel.Table.Column.Name"): ToolsRes.getString("DataFunctionPanel.Table.Column.Expression"); //$NON-NLS-1$ //$NON-NLS-2$
    }
    public Object getValueAt(int row, int col) {
    	DataFunction f = (DataFunction)functions.get(row);
    	return col == 0? f.getFunctionName(): f.getInputString();
    }
    public void setValueAt(Object value, int row, int col) {
      if (value instanceof String) {
        String val = (String) value;
        DataFunction f = (DataFunction)functions.get(row);
        if (col == 0) { // function name
        	if (val.equals(f.getFunctionName())) return;
       	  // check that name is not already being used
       	  boolean taken = data.getDataset(0).getXColumnName().equals(val);
       	  Iterator it = data.getDatasets().iterator();
       	  while (it.hasNext()) {
       		  if (taken) break;
       		  Dataset next = (Dataset)it.next();
       		  if (next == f) continue;
       		  taken = next.getYColumnName().equals(val);
       	  }
       	  if (taken) {
            JOptionPane.showMessageDialog(null, 
            				ToolsRes.getString("DataFunctionPanel.Dialog.DuplicateName.Message"), //$NON-NLS-1$
            				ToolsRes.getString("DataFunctionPanel.Dialog.DuplicateName.Title"), //$NON-NLS-1$
            				JOptionPane.WARNING_MESSAGE);
            return;
       	  }
       	  f.setFunctionName(val);
       	  refreshVars(f);
       	  tool.firePropertyChange("variable", null, null); //$NON-NLS-1$        	
        }
        else { // function
       	  f.setFunction(val);
      	  tool.firePropertyChange("data", null, null); //$NON-NLS-1$
        }
      }
    }
    public boolean isCellEditable(int row, int col) {
      return true;
    }
  }
  
  /**
   * A cell editor for the FunctionTable.
   */
  class FunctionCellEditor extends AbstractCellEditor implements TableCellEditor {
    JPanel panel = new JPanel(new BorderLayout());
    JTextField field = new JTextField();
    int keepFocus = -2;

    // Constructor.
    FunctionCellEditor() {
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
          if(e.getKeyCode()==KeyEvent.VK_ENTER) {
            stopCellEditing();
          	keepFocus = -2;
          } else {
            field.setBackground(Color.yellow);
          }
        }
      });
      field.addFocusListener(new FocusAdapter() {
        public void focusLost(FocusEvent e) {
          if(field.getBackground()!=Color.WHITE) {
            stopCellEditing();
          }
          int i = table.getSelectedRow();
          if (keepFocus == i) {
          	keepFocus = -2;
          }
          else table.requestFocusInWindow();
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
      if(e instanceof MouseEvent) {
        MouseEvent me = (MouseEvent) e;
      	int row = table.rowAtPoint(me.getPoint());
        keepFocus = row;
      	if (me.getClickCount()==2) {
          return true;
        }
      } else if(e instanceof ActionEvent) {
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
   * A cell renderer for the FunctionTable.
   */
  class FunctionCellRenderer extends DefaultTableCellRenderer {
    Font font = new JTextField().getFont();

    // Constructor
    public FunctionCellRenderer() {
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
      DataFunction f = (DataFunction)functions.get(row);
      if (col == 1 && !f.getFunction().equals(f.getInputString())) {
        setForeground(Color.BLACK);
        setBackground(LIGHT_RED);
      }
      else if(isSelected) {
        setForeground(Color.RED);
        setBackground(LIGHT_BLUE);
        refreshVars(f);
      } 
      else {
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
