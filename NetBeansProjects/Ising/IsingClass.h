/* 
 * File:   IsingClass.h
 * Author: bozhin
 *
 * Created on Петък, 2012, Май 11, 18:56
 */

#ifndef ISINGCLASS_H
#define	ISINGCLASS_H

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <ctime>

class IsingClass 
{
private:
    int idimx, idimy;
    int *spinMatrix;
    double J; // exchange integral
    double B; //external magnetic field

    // R-Matrix:
    // R(Spin,NeighbourSum):
    //   Spin = -1, +1
    //   NeighbourSum (NS) = -4, -2, 0, 2, 4
    // To use a normal array we redefine indices as follow:
    // +------------+------+------+
    // |     Spin   |  -1  |  +1  |
    // +------------+------+------+
    // | (Spin+1)/2 |   0  |   1  |
    // +------------+------+------+
    //
    // +----------+------+------+------+------+------+
    // |       NS |  -4  |  -2  |   0  |  +2  |  +4  |
    // +----------+------+------+------+------+------+
    // | (NS+4)/2 |   0  |   1  |   2  |   3  |   4  |
    // +----------+------+------+------+------+------+
    //
    // R(Spin,NS) = exp ( -2*Spin* ( B + J*NS ) )
    // R[i,j]     = exp ( -2*(2*i-1)*(B+J*(2*j-4)) ),
    // i = 0, 1; j = 0, 1, 2, 3, 4
    double rMatrix[2][5];
    
    int NeighbourSum(int i, int j);
    
public:
    double magneticMoment;
    double magneticEnergy;
    int iDimx, iDimy;
    // Initialization
    IsingClass(int dimx, int dimy, double _J, double _B);
    // Generation of new initial state.
    // In this program is used hot start: uniform distribution of
    // probability of -1 and +1
    void StateGen();
     // Monte Carlo Micro Step with toroidal topology
    void MCMSTT();
    // Monte Carlo Macro Step
    void MCMS(int numSteps); // numSteps = number of micro steps to do
    // Magnetic Moment calculation
    int MagneticMoment();
    // Calculation of Hamiltonian in case of Toroidal Topology
    double HamiltonianTT();
    // Function that sets J and B
    void SetJB(double _J, double _B);
};

#endif	/* ISINGCLASS_H */

