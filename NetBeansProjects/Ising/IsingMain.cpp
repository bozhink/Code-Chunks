/* 
 * File:   IsingMain.cpp
 * Author: bozhin
 *
 * Created on Петък, 2012, Май 11, 18:40
 */

#include <cstdlib>
#include <cstdio>
#include <ctime>
#include <iostream>
#include "IsingClass.h"
#include "Thermodynamics.h"

using namespace std;

/*
 * 
 */
#ifndef N
#define N 256
#endif

int main(int argc, char** argv) 
{
    IsingClass ic(N, N, 0.5, 0.05);
    ic.StateGen();
    ic.MCMS(N*N*2);
//    cout << N << endl;
//    cout << ic.iDimx << "\t" << ic.iDimy << endl;
//    cout << ic.MagneticMoment()*1.0/N/N << endl;
//    cout << ic.HamiltonianTT()/N/N << endl;
    
    Thermodynamics td;
    
    for (double J=-1.5; J<=1.5; J+=0.05)
    {
        ic.SetJB(J,0.5);
        td.CalculateProperties(ic, 100, N*N);
        cout << J << "\t" 
             << td.meanMagneticMoment << "\t"
             << td.magneticSusceptibility << "\t"
             << td.meanEnergy << "\t"
             << td.heatCapacitance << endl;
    }
    return 0;
}

