/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jtimer;

/**
 *
 * @author bozhin
 */
public class JTimer {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
       TimerDialog dialog = new TimerDialog(new javax.swing.JFrame(), true);
       dialog.addWindowListener(
               new java.awt.event.WindowAdapter()
               {
                    @Override
                    public void windowClosing(java.awt.event.WindowEvent e) 
                    {
                        System.exit(0);
                    }
                });
        dialog.setVisible(true);
    }
}
