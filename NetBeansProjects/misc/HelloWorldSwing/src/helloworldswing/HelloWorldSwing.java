/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helloworldswing;

import javax.swing.*;
/**
 *
 * @author bozhin
 */
public class HelloWorldSwing extends JFrame 
{
    public HelloWorldSwing()
    {
        super("hello");
        super.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        super.add(new JLabel("Hello, world!"));
        super.pack();
        super.setVisible(true);
    }
    /**
     * @param args the command line arguments
     */
    public static void main(final String[] args)
    {
        new HelloWorldSwing();
    }
}
