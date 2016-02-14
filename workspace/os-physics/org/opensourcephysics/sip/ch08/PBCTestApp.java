package org.opensourcephysics.sip.ch08;

import org.opensourcephysics.controls.*;
import org.opensourcephysics.numerics.*;

public class PBCTestApp extends AbstractCalculation{

   public PBCTestApp(){
   }

   public void reset(){
      control.setValue("x", -10);
      control.setValue("L", 3);
   }

   public void calculate(){
      double x=control.getDouble("x");
      double L=control.getDouble("L");
      control.clearMessages();
      control.println("position new="+PBC.position(x,L));
      control.println("separation new="+PBC.separation(x,L));
   }

   public static void main(String[] args){
      CalculationControl.createApp(new PBCTestApp());
   }

}
