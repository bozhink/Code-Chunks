import javax.swing.SwingUtilities;
import javax.swing.JFrame;
import javax.swing.JLabel;
 
public final class swing2 implements Runnable {
 
        public static void main(final String[] args) {
 
                /*
                 * Swing has its own dispatch thread, which is distinct from the main
                 * JVM (launcher) thread. This means that even if the (launcher) thread
                 * exited (this) main method, the Swing GUI thread would still be
                 * running, waiting to respond to user input, etc. and if the user
                 * closes the window, then the program would continue to run (due to the
                 * live GUI thread). As of Java 6, the GUI thread will automatically
                 * stop if all Components are hidden and disposed.
                 * 
                 * Execute all GUI code on the event dispatch thread, even
                 * initialization:
                 */
 
                SwingUtilities.invokeLater(new swing2());
        }
 
        public void run() {
 
                // Create frame with title "Hello, World!"
 
                final JFrame frame = new JFrame("Hello, World!");
 
                /*
                 * Previously, we typically attached a window listener to our main
                 * JFrame and on windowClosing() event notification callback, we would
                 * explicitly call System.exit(stat) or some other such nastiness. The
                 * following is the new (clean) way of defining default close behavior
                 * for a JFrame. The following will merely dispose the JFrame but it
                 * will not stop the application unless *all* Windows are disposed.
                 */
                frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
 
                /*
                 * This stops the app on window close. (It is commented out.)
                 * frame.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE); JFrame, which
                 * is the "window" component of Swing, has an interesting feature: it
                 * has a layered content architecture that (conceptually) allows for
                 * placement of a component of the JFrame in a designated layer. The
                 * layers can be conceptually viewed as a series of transparencies
                 * placed one above another in an overhead projector. Swing typically
                 * places user components (such as buttons, etc.) in what it calls its
                 * "content pane". This pane is in the layer that is below most of the
                 * other (transparent) layers. What are the layers for? Think of when
                 * you right-click on a control and it "pops" a contextual menu "over"
                 * the original control; or, when you press "help" for a control or
                 * hover the mouse for a "tool tip" and the information is "placed over
                 * the control". How is that done? By rendering the information in a
                 * layer "above" the lower level "content" pane. So: The standard way of
                 * adding a component to a "multi-pane" container such as JFrame is by
                 * first establishing a reference to its "content pane" (which is, by
                 * default, just a JPanel with BorderLayout) and adding the components
                 * of the JFrame to the content pane and NOT directly to the JFrame.
                 * (The latest Swing release, however, alters the semantics of the
                 * JFrame.add(..) to assume convenient addition to the content pane).
                 */
 
                frame.getContentPane().add(new JLabel("Hello, World!"));
                // center the frame on the screen
                frame.setLocationRelativeTo(null);
                /*
                 * Remember the relative layouts of Swing? pack() tells the receiving
                 * container (here "this" JFrame) for it to optimally pack its
                 * components according to its layout.
                 */
 
                frame.pack();
                frame.setVisible(true);
        }
}
