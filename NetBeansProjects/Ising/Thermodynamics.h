/* 
 * File:   Thermodynamics.h
 * Author: bozhin
 *
 * Created on Събота, 2012, Май 12, 0:10
 */

#ifndef THERMODYNAMICS_H
#define	THERMODYNAMICS_H

#include "IsingClass.h"

class Thermodynamics {
public:
    double meanMagneticMoment;
    double meanEnergy;
    double magneticSusceptibility;
    double heatCapacitance;

    // Calculation of magnetic properties
    // numSamples = number of samples to be taken
    // mcSteps = Monte Carlo Micro Steps
    void CalculateMagneticProperties(IsingClass ising, 
        int numSamples, int mcSteps);
    // Calculation of magnetic and energetic properties
    // numSamples = number of samples to be taken
    // mcSteps = Monte Carlo Micro Steps
    void CalculateProperties(IsingClass ising, int numSamples, int mcSteps);
private:

};

#endif	/* THERMODYNAMICS_H */

