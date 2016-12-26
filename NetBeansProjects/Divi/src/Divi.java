// code by behzad torkian
//java code for Divided Difference table and evaluate
//behzad25241@yahoo.com
//www.torkian.info
//march/08


import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;


public class Divi extends JFrame {
  private JButton jbtPoints = new JButton("Points");
  private JButton jbtEnter = new JButton("Enter Data");
  private JButton jbtEv = new JButton("Evaluate");
  private JButton jbtHelp = new JButton("Help");
  private JButton jbtReset = new JButton("Reset");
  private JButton jbtDraw = new JButton("Draw");
  int point=0;
  	final double x[]=new double[200];
  	final double fx[]=new double[200];
  	final double data[][] = new double[200][200];
  
  public Divi() {
  
    //setLayout(new FlowLayout());
    setLayout(new GridLayout(5, 2, 20, 20));
    add(jbtReset);
    add(jbtPoints);
    add(jbtEnter);
    add(jbtEv);
    add(jbtDraw);
    add(jbtHelp);
    add(new DrawX());
     jbtDraw.setEnabled(false);
      jbtPoints.setEnabled(true);
       jbtEv.setEnabled(false);
       jbtEnter.setEnabled(false);
   

    jbtReset.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        System.out.println("The " + e.getActionCommand() + " button "
          + "is clicked at\n  " + new java.util.Date(e.getWhen()));
          JOptionPane.showMessageDialog(null,"		Reset is done");
          point=0;
          jbtPoints.setEnabled(true);
          jbtEv.setEnabled(false);
          jbtEnter.setEnabled(false);
      }
    });
        jbtDraw.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        System.out.println("The " + e.getActionCommand() + " button "
          + "is clicked at\n  " + new java.util.Date(e.getWhen()));
         // repaint();
        // add(new DrawX());
      }
    });

    jbtPoints.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        System.out.println("The " + e.getActionCommand() + " button "
          + "is clicked at\n  " + new java.util.Date(e.getWhen()));
         String spoint= JOptionPane.showInputDialog("Enter Number of points",3);
         point = Integer.parseInt(spoint);
         jbtPoints.setEnabled(false);
         jbtEnter.setEnabled(true);
      }
    });
    jbtEnter.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        System.out.println("The " + e.getActionCommand() + " button "
          + "is clicked at\n  " + new java.util.Date(e.getWhen()));
          String sx= JOptionPane.showInputDialog("Enter x (note: use , for each x)");
          StringTokenizer sxt = new StringTokenizer(sx, ",");
          int i=0;
          jbtEnter.setEnabled(false);
          jbtEv.setEnabled(true);
          while(sxt.hasMoreTokens()){
          String s=sxt.nextToken();
          System.out.println(s+":");
          x[i]= Double.parseDouble(s);
          i++;
          }
          String sfx= JOptionPane.showInputDialog("Enter F[x] (note: use , for each F[x])");
          StringTokenizer sxft = new StringTokenizer(sfx, ",");
           i=0;
          while(sxft.hasMoreTokens()){
          String ss=sxft.nextToken();
          System.out.println(ss+":");
          fx[i]= Double.parseDouble(ss);
          data[0][i]=fx[i];
          i++;
          }
          // 2  one for matrix one for last data
          for(int count1=1;count1<point;count1++)
           {
           	for(int count2=count1;count2<point;count2++)
           	{
           		double fx1= data[count1-1][count2-1];
           		double fx2= data[count1-1][count2];
           		double x1=x[(count2-count1)];
           		double x2=x[count2];
				/*System.out.println(fx1);
           		System.out.println(fx2);
           		System.out.println(x1);
           		System.out.println(x2);*/
           		data[count1][count2]=((fx2-fx1)/(x2-x1));
           		System.out.println(data[count1][count2]);
           		
           	}
           }
          
          
      }
    });
     jbtEv.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        System.out.println("The " + e.getActionCommand() + " button "
          + "is clicked at\n  " + new java.util.Date(e.getWhen()));
          String sNewX= JOptionPane.showInputDialog("Enter New x to find F[x]");
         double newx = Double.parseDouble(sNewX);
         double total=1;
         double sum=0;
         for (int count3=0;count3<(point-1);count3++)
         {
         	for (int count4=0;count4<=count3;count4++)
         	{
         		total=(newx-x[count4])*total;
         		System.out.println(total+ "loop");
         	}
         	total=total*fx[(count3+1)];
         	System.out.println(fx[(count3+1)]+ "data");
         	System.out.println(total+ "last");
         	sum=sum+total;
         	System.out.println(sum+ "sum");
         	total=1;
         }
         sum=sum+fx[0];
         JOptionPane.showMessageDialog(null,"F["+newx+"]="+sum);
         //System.out.println(sum);
         
       
         
      }
    });
    jbtHelp.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        System.out.println("The " + e.getActionCommand() + " button "
          + "is clicked at\n  " + new java.util.Date(e.getWhen()));
           JOptionPane.showMessageDialog(null,"Reset: Enter new Data\nPoint: Number of points\nEnter: x's and F[x]\nEvaluate: Find F[x] for new x \nCode by Behzad Torkian");
      }
    });
  }

  /** Main method */
  public static void main(String[] args) {
    Divi frame = new Divi();
    frame.setTitle("Newton's Divided Difference method");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(400, 400);
    frame.setVisible(true);
  }
   

class DrawX extends JPanel {
 

    protected void paintComponent(Graphics g) {
      super.paintComponent(g);

      g.drawLine(10, 200, 390, 200);
      g.drawLine(200, 30, 200, 390);

      // Draw arrows
      g.drawLine(390, 200, 370, 190);
      g.drawLine(390, 200, 370, 210);
      g.drawLine(200, 30, 190, 50);
      g.drawLine(200, 30, 210, 50);

      // Draw x, y axises
      g.drawString("X", 390, 170);
      g.drawString("Y", 220, 40);

      // Draw function
      Polygon p = new Polygon();
      
      double scaleFactor = 0.0001;

      for (int xx = -120; xx <= 120; xx++) {
         double total=1;
         double sum=0;
         for (int count3=0;count3<(point-1);count3++)
         {
         	for (int count4=0;count4<=count3;count4++)
         	{
         		total=(xx-x[count4])*total;
         	}
         	total=total*data[0][(count3+2)];
         	sum=sum+total;
         	total=1;
         }
         sum=sum+fx[0];
       p.addPoint(xx + 200, 200 - (int)sum);
      }
   
       
       g.drawPolyline(p.xpoints, p.ypoints, p.npoints);
  
    }
  }
  }