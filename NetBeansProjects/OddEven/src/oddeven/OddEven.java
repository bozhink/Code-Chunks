/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package oddeven;

import javax.swing.JOptionPane;
/**
 *
 * @author bozhin
 */
public class OddEven {
    /**
     * "input" is the number that user gives to the computer
     */
    private int input; // a whole number("int" means integer)
    /**
     * This is the constructor method. It gets called when an object
     * of the OddEven type is being created.
     */
    public OddEven() {
        
    }
    /**
     * This is the main method. It gets called when this
     * class is run through a Java interpreter.
     * @param args the command line arguments (unused)
     */
    public static void main(String[] args) {
        OddEven number = new OddEven();
        number.showDialog();
    }
    
    public void showDialog() {
        try {
            this.input = Integer.parseInt(
                    JOptionPane.showInputDialog(
                    "Please enter a number."));
            this.calculate();
        } catch (final NumberFormatException e) {
            System.err.println(
                    "ERROR: Invalid input. Please type in a numerical value");
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    /**
     * When this gets called, it sends a message to the interpreter.
     * The interpreter usually shows it on the command prompt
     * (For Windows users) or the terminal (For *nux users).
     * (Assuming it's open)
     */
    private void calculate() {
        if ((this.input % 2)==0) {
            JOptionPane.showMessageDialog(null, "Even");
        } else {
            JOptionPane.showMessageDialog(null, "Odd");
        }
    }
}
