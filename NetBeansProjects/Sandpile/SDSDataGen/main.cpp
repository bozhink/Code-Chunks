/*
 * Project: SDS Data Generation
 * File:   main.cpp
 * Author: bozhin
 *
 * Created on November 16, 2012, 10:13 PM
 */

#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <math.h>
#include <iostream>
#include <fstream>

#include "sdsmodel.h"

#define STATISTICS 10


using namespace std;

/*
 *
 */
int main(int argc, char** argv)
{
    int L;
    int N;
    char*filename;
    int t, t_min, t_max;
    int s, s_min, s_max;

    if (argc < 3)
    {
        fprintf(stderr, "Usage: %s [<N>] <L> <data file>\n", argv[0]);
        fprintf(stderr, "Where:\n");
        fprintf(stderr, "    N         -- number of samplings;\n");
        fprintf(stderr, "    L         -- size of model's matrix;\n");
        fprintf(stderr, "    data file -- size of model's matrix;\n");
        return 1;
    } else if (argc == 3) {
        L = atoi(argv[1]);
        filename = argv[2];
        N = STATISTICS;
    } else {
        N = atoi(argv[1]);
        L = atoi(argv[2]);
        filename = argv[3];
    }

    FILE*f_data = fopen(filename, "a");
    if (!f_data) perror ("Unable to open s-moments output file");

    SDSModel sds(L, L);

    s_min = 10;
    t_min = 10;
    s_max = 0;
    t_max = 0;
    for (int i=0; i<N; i++) {
        sds.Randomize();
        sds.UNextStep();
        s = sds.Get_s();
        t = sds.Get_t();
        t_min = min(t, t_min);
        t_max = max(t, t_max);
        s_min = min(s, s_min);
        s_max = max(s, s_max);
        fprintf(f_data, "%d %d\n", t, s);
        if (!(i%1000)) {
            printf("\n\nIteration #%d\n", i);
            printf("   t_min=%6d   t_max=%8d\n", t_min, t_max);
            printf("   s_min=%6d   s_max=%8d\n", s_min, s_max);
        }
    }
    printf("\n\nIteration #%d\n", N);
    printf("   t_min=%6d   t_max=%8d\n", t_min, t_max);
    printf("   s_min=%6d   s_max=%8d\n", s_min, s_max);

    fclose(f_data);
    cout << "END" << endl;
    return 0;
}

