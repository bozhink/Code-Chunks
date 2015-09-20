import java.awt.Container;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class FontPanel extends JPanel {

  public void paintComponent(Graphics g) {
    super.paintComponent(g);

    Font f = new Font("SansSerif", Font.BOLD, 14);
    Font fi = new Font("SansSerif", Font.BOLD + Font.ITALIC, 14);
    FontMetrics fm = g.getFontMetrics(f);
    FontMetrics fim = g.getFontMetrics(fi);

    String s1 = "Java ";
    String s2 = "Source and Support";
    String s3 = " at www.java2s.com";
    int width1 = fm.stringWidth(s1);
    int width2 = fim.stringWidth(s2);
    int width3 = fm.stringWidth(s3);

    Dimension d = getSize();
    int cx = (d.width - width1 - width2 - width3) / 2;
    int cy = (d.height - fm.getHeight()) / 2 + fm.getAscent();

    g.setFont(f);
    g.drawString(s1, cx, cy);
    cx += width1;
    g.setFont(fi);
    g.drawString(s2, cx, cy);
    cx += width2;
    g.setFont(f);
    g.drawString(s3, cx, cy);
  }
  public static void main(String[] args) {
    JFrame frame = new JFrame();
    frame.setTitle("NotHelloWorld2");
    frame.setSize(350, 200);
    frame.addWindowListener(new WindowAdapter() {
      public void windowClosing(WindowEvent e) {
        System.exit(0);
      }
    });
    Container contentPane = frame.getContentPane();
    contentPane.add(new FontPanel());

    frame.show();
  }

}
