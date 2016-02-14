package org.opensourcephysics.sip.ch03;
import org.opensourcephysics.tools.*;

/**
 * DataLoaderApp reads a data file using the OSP ResourceLoader.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/16/05
 */
public class DataLoaderApp {

   /**
    * Starts the Java application.
    * @param args command line parameters
    */
   public static void main(String[] args) {
      String fileName = "falling.txt";   //  reads from directory where DataLoaderApp is located
      // gets the data file
      Resource res = ResourceLoader.getResource(fileName, DataLoaderApp.class);
      String data = res.getString();
      String[] lines = data.split("\n"); // split string on newline character
      // extract x-y data from every line
      for(int i = 0, n = lines.length; i<n; i++) {
         if(lines[i].trim().startsWith("//")) {
            continue;                                     // skip comment lines
         }
         String[] numbers = lines[i].trim().split("\\s"); // split on any white space
         System.out.print("t = "+numbers[0]);
         System.out.println("  y = "+numbers[1]);
      }
   }
}
