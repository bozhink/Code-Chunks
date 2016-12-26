/*
 * File:   sdsmodel.h
 * Author: Bozhin Karaivanov
 *
 * Created on November 3, 2012, 9:55 AM
 */

#ifndef SDSMODEL_H
#define	SDSMODEL_H
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include <fstream>
#include <unistd.h>
#include <fcntl.h>


#define Z_CRITICAL 2

using namespace std;


class SDSModel {
    int s; // Size of the avalanche
    int t; // Length of the avalanche
    unsigned**main_matrix; // Spin Matrix
    int Lx, Ly; // Sizes of the matrix
    int Lmiddle; // Half of Lx
    void update(int, int); // Updates matrix and the values of s and t
    void Update(); //updates matrix. Non-recursive method
    void construct(int, int);
public:
    SDSModel();
    SDSModel(int);
    SDSModel(int,int);
    ~SDSModel();

    int Get_s();
    int Get_t();
    void GetSize(int*,int*);
    void Randomize();
    void NextStep();
    void UNextStep(); // Next step using the non-recursive update method
    double GetEnergy();
    double GetEnergy1();
};


#endif	/* SDSMODEL_H */

