import javax.swing.JFrame;
import javax.swing.JLabel;
 
public class swing1 {
 
    public static void main(final String[] args) {
       // Create frame with title "Hello, World!"
       JFrame frame = new JFrame("Hello, World!");
 
       //This stops the app on window close.
       frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
 
       // add a label in the frame, same as frame.getContentPane().add
       frame.add(new JLabel("Hello, World!"));
 
       // make sure Size of the frame is set according to its content
       frame.pack();
 
       // set the frame visible
       frame.setVisible(true);
    }
}
