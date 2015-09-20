import java.io.*;

class RWData{
  public static void main(String args[])
    throws IOException
  {
    
    DataOutputStream dataOut;
    DataInputStream dataIn;
    
    int i = 10;
    double d = 1023.56;
    boolean b = true;
    
    try{
      dataOut = new DataOutputStream(new FileOutputStream("testdata.dat"));
    }
    catch(IOException exc) {
      System.out.println("Cannot open file.");
      return;
    }
    
    try{
      System.out.println("Writing " + i);
      dataOut.writeInt(i);
      
      System.out.println("Writing " + d);
      dataOut.writeDouble(d);
      
      System.out.println("Writing " + b);
      dataOut.writeBoolean(b);
      
      System.out.println("Writing " + 12.2*7.4);
      dataOut.writeDouble(12.2*7.4);
    }
    catch(IOException exc){
      System.out.println("Write error");
    }
    dataOut.close();
    
  }
}