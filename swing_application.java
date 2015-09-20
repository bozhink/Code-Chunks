// Hello.java (Java SE 5)
import java.awt.BorderLayout;
import javax.swing.*;
 
public class Hello extends JFrame {
    public Hello() {
        super("hello");
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());
        add(new JLabel("Hello, world!"));
        pack();
    }
 
    public static void main(String[] args) {
        new Hello().setVisible(true);
    }
}
