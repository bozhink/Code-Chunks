/* 
 * File:   IsingClass.cpp
 * Author: bozhin
 * 
 * Created on Петък, 2012, Май 11, 18:56
 */

#include "IsingClass.h"

// Initialization
IsingClass::IsingClass(int dimx, int dimy, double _J, double _B)
{
    idimx = dimx;
    idimy = dimy;
    iDimx = idimx;
    iDimy = idimy;
    magneticMoment = 0.0;
    magneticEnergy = 0.0;
    J = _J;
    B = _B;
    int i, j;
    for (i = 0; i < 2; i++) for (j = 0; j < 4; j++)
    {
        rMatrix[i][j] = exp(-2 * (2 * i - 1) * (B + J * (2 * j - 4)));
    }
    spinMatrix = new int[idimx*idimy];
    /* initialize random seed: */
    srand ( time(NULL) );
}

// Generation of new initial state.
// In this program is used hot start: uniform distribution of
// probability of -1 and +1
void IsingClass::StateGen()
{
    for (int i = 0; i < idimx*idimy; i++) spinMatrix[i] = (2*(rand()%2)-1);
}

int IsingClass::NeighbourSum(int i, int j)
{
    int ni = idimx + i;
    int nj = idimy + j;
    return spinMatrix[((ni + 1) % idimx)*idimx + j] +
         spinMatrix[((ni - 1) % idimx)*idimx + j] +
         spinMatrix[i*idimx + ((nj + 1) % idimy)] +
         spinMatrix[i*idimx + ((nj - 1) % idimy)];
}

// Monte Carlo Micro Step with toroidal topology
void IsingClass::MCMSTT()
{
    int i, j, rx, ry; // NS = Neighbour Sum
    i = rand() % idimx;
    j = rand() % idimy;
    
    rx = (spinMatrix[i*idimx+j]+1)/2;
    ry = (NeighbourSum(i,j)+4)/2;
    
    if (rand()*1.0/RAND_MAX < rMatrix[rx][ry])
        spinMatrix[i*idimx+j] = -spinMatrix[i*idimx+j];
}

// Monte Carlo Macro Step
void IsingClass::MCMS(int numSteps) // numSteps = number of micro steps to do
{
    for (int i = 0; i < numSteps; i++) MCMSTT();
}

// Magnetic Moment calculation
int IsingClass::MagneticMoment()
{
    magneticMoment = 0.0;
    for (int i = 0; i < idimx*idimy; i++) magneticMoment += spinMatrix[i];
    return magneticMoment;
}

// Calculation of Hamiltonian in case of Toroidal Topology
double IsingClass::HamiltonianTT()
{
    int i, j;
    int im = 0, ns = 0;
    for (i = 0; i < idimx; i++) for (j = 0; j < idimy; j++)
    {
        im += spinMatrix[i*idimx+j];
        ns += spinMatrix[i*idimx+j] * NeighbourSum(i, j);
    }
    magneticMoment = im;
    magneticEnergy = -J * ns + B * im;
    return magneticEnergy;
}

void IsingClass::SetJB(double _J, double _B)
{
    J = _J;
    B = _B;
}
