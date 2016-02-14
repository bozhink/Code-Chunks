/*
 * Open Source Physics software is free software as described near the bottom of this code file.
 *
 * For additional information and documentation on Open Source Physics please see:
 * <http://www.opensourcephysics.org/>
 */

package org.opensourcephysics.tools;

import org.opensourcephysics.numerics.MultiVarFunction;
import org.opensourcephysics.numerics.ParsedMultiVarFunction;
import org.opensourcephysics.numerics.ParserException;

/**
 * A known function for which the expression and parameters are user-editable. 
 * 
 * @author Douglas Brown
 */
public class UserFunction implements KnownFunction {
	
	// instance fields
	protected String name;
	protected String[] paramNames = new String[0];
	protected double[] paramValues = new double[0];
	protected String expression = ""; //$NON-NLS-1$
	protected String dummyVar = "dummy"; //$NON-NLS-1$
	protected MultiVarFunction function = null;
	protected String var = "x"; //$NON-NLS-1$
	
  /**
   * Constructor.
   *
   * @param name the function name
   */
	public UserFunction(String name) {
		setName(name);
	}

  /**
   * Gets the name.
   *
   * @return the name
   */
	public String getName() {
		return name;
	}

  /**
   * Sets the name.
   *
   * @param name the name
   */
	public void setName(String name) {
		this.name = name;
	}

  /**
   * Gets the current independent variable.
   *
   * @return the variable name
   */
	public String getIndependentVariable() {
		return var;
	}

  /**
   * Gets the expression.
   *
   * @return the expression
   */
	public String getExpression() {
		// replace dummy with var name
		return expression.replaceAll(dummyVar, var);
	}

  /**
   * Gets the expression and sets the independent variable.
   *
   * @param indepVarName the name of the independent variable
   * @return the expression
   */
	public String getExpression(String indepVarName) {
		var = indepVarName;
		return getExpression();
	}

  /**
   * Sets the expression.
   *
   * @param exp a parsable function of the parameters and independent variable 
   * @param indepVarName the name of the independent variable
   * @return true if successfully parsed
   */
	public boolean setExpression(String exp, String indepVarName) {
		var = indepVarName;
		// try to parse expression
		// replace indep var with dummy name
		exp = exp.replaceAll(var, dummyVar);
		int n = paramNames.length + 1;
		String[] names = new String[n];
		names[0] = dummyVar;
		for (int i = 1; i < n; i++) {
			names[i] = paramNames[i-1];
		}
		try {
			function = new ParsedMultiVarFunction(exp, names);
			// successful, so save expression unless it contains "="
			if (exp.indexOf("=") == -1) { //$NON-NLS-1$
				expression = exp;
				return true;
			}
		}
		catch (ParserException ex) {}
		return false;
	}

  /**
   * Gets the parameter count.
   * @return the number of parameters
   */
	public int getParameterCount() {
		return paramNames.length;
	}

  /**
   * Gets a parameter name.
   *
   * @param i the parameter index
   * @return the name of the parameter
   */
	public String getParameterName(int i) {
		return paramNames[i];
	}

  /**
   * Gets a parameter value.
   *
   * @param i the parameter index
   * @return the value of the parameter
   */
	public double getParameterValue(int i) {
		return paramValues[i];
	}

  /**
   * Sets a parameter value.
   *
   * @param i the parameter index
   * @param value the value
   */
	public void setParameterValue(int i, double value) {
		paramValues[i] = value;
	}

  /**
   * Sets the parameters.
   *
   * @param names the parameter names
   * @param values the parameter values
   */
	public void setParameters(String[] names, double[] values) {
		paramNames = names;
		paramValues = values;
	}

  /**
   * Evaluates the function at x.
   *
   * @param x 
   * @return f(x)
   */
	public double evaluate(double x) {
		if (function == null) return Double.NaN;
		int n = paramValues.length + 1;
		double[] values = new double[n];
		values[0] = x;
		System.arraycopy(paramValues, 0, values, 1, n-1);
		return function.evaluate(values);
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
