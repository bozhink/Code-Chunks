/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication5;

import java.io.*;

/**
 *
 * @author bozhin
 */
public class JavaApplication5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        FileInputStream fin;
        
        try
        {
            fin = new FileInputStream(args[0]);
        }
        catch (FileNotFoundException e)
        {
            System.err.println("File not found");
            return;
        }
        catch (ArrayIndexOutOfBoundsException e)
        {
            System.err.println("Usage: app <filename>");
            return;
        }
        int i = 0;
        
        NewJDialog dialog = new NewJDialog(new javax.swing.JFrame(), true);
        dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    @Override
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
        
        
        do {
            try
            {
                i = fin.read();
                if (i!=-1) {
                    dialog.putText((char) i);
                }
            }
            catch (IOException e)
            {
                
            }
        } while (i != -1);
        
        dialog.setVisible(true);
    }
}
