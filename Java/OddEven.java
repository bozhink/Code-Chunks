// OddEven.java
import javax.swing.JOptionPane;
 
public class OddEven {
    public static void main(String[] args) {
        // This is the main method. It gets called when this class is run through a Java interpreter.
        OddEven number = new OddEven();
        /* This line of code creates a new instance of this class called "number" and 
         * initializes it, and the next line of code calls the "showDialog()" method, 
         * which brings up a prompt to ask you for a number
         */
        number.showDialog();
    }
    private int input; // A whole number("int" means integer)
        // "input" is the number that the user gives to the computer
 
    public OddEven() {
        /* This is the constructor method. It gets called when an object of the OddEven type
         * is created.
         */
    }
 
    public void showDialog() {
        try 
        /* This makes sure nothing goes wrong. If something does, 
         * the interpreter skips to "catch" to see what it should do.
         */
        {
                input = Integer.parseInt(JOptionPane.showInputDialog("Please Enter A Number"));
                calculate();
                /*
                 * The code above brings up a JOptionPane, which is a dialog box
                 * The String returned by the "showInputDialog()" method is converted into
                 * an integer, making the program treat it as a number instead of a word.
                 * After that, this method calls a second method, calculate() that will
                 * display either "Even" or "Odd."
                 */
        }
        catch (NumberFormatException e)
        /* This means that there was a problem with the format of the number 
         * (Like if someone were to type in 'Hello world' instead of a number).
         */
        {
                System.err.println("ERROR: Invalid input. Please type in a numerical value.");
        }
    }
 
    private void calculate() {
        if (input % 2 == 0)
                System.out.println("Even");
        /* When this gets called, it sends a message to the interpreter. 
         * The interpreter usually shows it on the command prompt (For Windows users) 
         * or the terminal (For Linux users).(Assuming it's open)
         */
        else
                System.out.println("Odd");
    }
}
