/*
 * Open Source Physics software is free software as described near the bottom of this code file.
 *
 * For additional information and documentation on Open Source Physics please see:
 * <http://www.opensourcephysics.org/>
 */

package org.opensourcephysics.display;

import java.util.*;

import org.opensourcephysics.controls.*;
import org.opensourcephysics.numerics.*;

/**
 * This is a dataset whose values are determined by a multivariable function
 * evaluated with input constants and linked datasets. 
 *
 * @author Douglas Brown
 */
public class DataFunction extends Dataset {

  // instance fields
	DatasetManager inputData;
	ParsedMultiVarFunction function;
	String functionString;
	String inputString; // recent attempted function string, successful or not
	int varCount;
	ArrayList constantNames = new ArrayList();
	ArrayList data = new ArrayList();

  /**
   * Constructs a DataFunction using the specified input data.
   * The input should be a linked DatasetManager.
   *
   * @param input the input data
   */
  public DataFunction(DatasetManager input) {
		inputData = input;
		setXYColumnNames(input.getDataset(0).getXColumnName(), "Var"); //$NON-NLS-1$
		setFunction("0"); //$NON-NLS-1$
  }
  
  /**
   * Sets the function string.
   *
   * @param f the function string
   * @return true if successful
   */
  public void setFunction(String f) {
  	// set the variable count for refresh purposes
		varCount = getVarCount();
    try {
			function = new ParsedMultiVarFunction(f, getVarNames());
			functionString = f;
			inputString = f;
			refresh();
		}
		catch (ParserException ex) {
			setFunction("0"); //$NON-NLS-1$
			inputString = f; // unsuccessful string
		}
  }
  
  /**
   * Gets the function string.
   *
   * @return the function string
   */
  public String getFunction() {
    return functionString;
  }
  
  /**
   * Sets the function name.
   *
   * @param name the function name
   */
  public void setFunctionName(String name) {
  	if (name == null || name.equals("")) return; //$NON-NLS-1$
		setXYColumnNames(getXColumnName(), name);
  }
  
  /**
   * Gets the function name.
   *
   * @return the function name
   */
  public String getFunctionName() {
		return getYColumnName();
  }
  
  /**
   * Gets the current input string. If the last attempt to set the function
   * was unsuccessful, this is different from the function string.
   *
   * @return the input string
   */
  public String getInputString() {
		return inputString;
  }
  
  /**
   * Sets a constant value.
   *
   * @param name the constant name
   * @param value the constant value
   */
  public void setConstant(String name, double value) {
  	Map constants = inputData.getProperties();
  	synchronized(constants) {
  		constants.put(name, new Double(value));
  	}
  	refresh();
  }
  
  /**
   * Removes a constant definition.
   *
   * @param name the constant name
   */
  public void removeConstant(String name) {
  	Map constants = inputData.getProperties();
  	synchronized(constants) {
    	constants.remove(name);
  	}
  	refresh();
  }
  
  /**
   * Refreshes the data points.
   */
  public void refresh() {
  	super.clear();
  	if (function == null) return;
  	// watch for change in inputs
  	if (varCount != getVarCount()) {
  		setFunction(getFunction());
  		return;
  	}
		double[][] data = getData();
		double[] fData = new double[data.length];
		for (int n = 0; n < data[0].length; n++) { // number of data values for each variable
			for (int i = 0; i < data.length; i++) { // number of variables
				fData[i] = data[i][n];
			}
			super.append(fData[0], function.evaluate(fData));
		}
  }
  
  /**
   * @return the name of this DataFunction
   */
  public String toString() {
  	return getFunctionName();
  }
  
  /**
   * Overrides Dataset methods. DatasetFunction manages its own data.
   */
  public void append(double x, double y) {/** empty block */}
  public void append(double x, double y, double dx, double dy) {/** empty block */}
  public void append(double[] x, double[] y) {/** empty block */}
  public void append(double[] x, double[] y, double[] dx, double[] dy) {/** empty block */}
  public void clear() {/** empty block */}
  
//______________________________ private methods ___________________________

  // returns arrays of values  
  private double[][] getData() {
  	int length = 0;
  	data.clear();
  	Iterator it = inputData.getDatasets().iterator();
  	while (it.hasNext()) {
  		Dataset dataset = (Dataset)it.next();
  		if (dataset == this) continue;
  		if (data.isEmpty()) {
  			double[] xPoints = dataset.getXPoints();
  			length = xPoints.length;
  			data.add(xPoints);
  		}
  		data.add(dataset.getYPoints());
  	}
  	Map constants = inputData.getProperties();
  	it = constantNames.iterator();
  	while (it.hasNext()) {
  		double[] points = new double[length];
  		Double val = (Double)constants.get(it.next());
  		for (int i = 0; i < length; i++) {
  			points[i] = val.doubleValue();
  		}
  		data.add(points);
  	}
  	return (double[][])data.toArray(new double[0][0]);
  }
  
  private int getVarCount() {
		ArrayList list = inputData.getDatasets();		
		int count = list.contains(this)? list.size()-1: list.size();
		return count + getConstantNames().size();
  }

  private ArrayList getConstantNames() {
  	constantNames.clear();
  	Map constants = inputData.getProperties();
  	synchronized(constants) {
  		Iterator it = constants.keySet().iterator();
  		while (it.hasNext()) {
  			String name = (String)it.next();
  			if (constants.get(name) instanceof Double) { 
  				constantNames.add(name);
  			}
  		}
  	}
  	return constantNames;
  }

  private String[] getVarNames() {
  	ArrayList names = new ArrayList();
  	Iterator it = inputData.getDatasets().iterator();
  	while (it.hasNext()) {
  		Dataset dataset = (Dataset)it.next();
  		if (dataset == this) continue;
  		if (names.isEmpty()) names.add(dataset.getXColumnName());
  		names.add(dataset.getYColumnName());
  	}
  	names.addAll(constantNames);
  	return (String[])names.toArray(new String[0]);
  }

  /**
   * Returns the XML.ObjectLoader for this class.
   *
   * @return the object loader
   */
  public static XML.ObjectLoader getLoader() {
    return new Loader();
  }

  /**
   * A class to save and load Dataset data in an XMLControl.
   */
   protected static class Loader extends XMLLoader {
    public void saveObject(XMLControl control, Object obj) {
      DataFunction data = (DataFunction)obj;
      control.setValue("function", data.getFunction()); //$NON-NLS-1$
      control.setValue("function_name", data.getFunctionName()); //$NON-NLS-1$
//      control.setValue("name", data.getName());
//      control.setValue("marker_shape", data.getMarkerShape());
//      control.setValue("marker_size", data.getMarkerSize());
//      control.setValue("sorted", data.isSorted());
//      control.setValue("connected", data.isConnected());
//      control.setValue("line_color", data.getLineColor());
//      control.setValue("fill_color", data.getFillColor());
//      control.setValue("edge_color", data.getEdgeColor());
      control.setValue("datasetID", data.datasetID); //$NON-NLS-1$
    }

    public Object createObject(XMLControl control){
    	// must be instantiated by object with linked DatasetManager
      return null;
    }

    public Object loadObject(XMLControl control, Object obj) {
      DataFunction data = (DataFunction)obj;
      data.setFunction(control.getString("function")); //$NON-NLS-1$
      data.setFunctionName(control.getString("function_name")); //$NON-NLS-1$
//      data.setName(control.getString("name"));
//      if(control.getPropertyNames().contains("marker_shape")) {
//        data.setMarkerShape(control.getInt("marker_shape"));
//      }
//      if(control.getPropertyNames().contains("marker_size")) {
//        data.setMarkerSize(control.getInt("marker_size"));
//      }
//      data.setSorted(control.getBoolean("sorted"));
//      data.setConnected(control.getBoolean("connected"));
//      Color color = (Color)control.getObject("line_color");
//      if(color!=null) {
//        data.setLineColor(color);
//      }
//      color = (Color)control.getObject("fill_color");
//      Color edge = (Color)control.getObject("edge_color");
//      if(color!=null) {
//        if(edge!=null) {
//          data.setMarkerColor(color, edge);
//        }
//        else data.setMarkerColor(color);
//      }
      data.setID(control.getInt("datasetID")); //$NON-NLS-1$
      return obj;
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
