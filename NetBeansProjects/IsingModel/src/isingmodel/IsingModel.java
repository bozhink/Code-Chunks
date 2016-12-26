/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package isingmodel;

/**
 *
 * @author bozhin
 */
public class IsingModel {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) 
    {
        System.err.println("Ising Model Simulation");
        model.ising.IsingClass ising = new model.ising.IsingClass(100,100,1.0,0.0);
        ising.StateGen();
        ising.MCMS(100*100);
        ising.MagneticMoment();
        System.out.println(ising.magneticMoment);
    }
}
