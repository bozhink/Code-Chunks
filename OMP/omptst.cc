// file: omptst.cc
// compilation:
// gcc -Wall -fopenmp omptst.cc -lstdc++ -o omptest
//
// IOstream library is not thread-safe. Therefore, for instance,
// cout calls must be executed in critical areas or by only one
// thread (e.g. masterthread).

#include <iostream>
using namespace std;

#include <omp.h>

int main(int argc, char **argv) {
    int th_id, nthreads;
#pragma omp parallel private(th_id) shared(nthreads)
{
    th_id = omp_get_thread_num();
#pragma omp critical
{
    cout << "Hello World from thread " << th_id << endl;
}
#pragma omp barrier

#pragma omp master
{
    nthreads = omp_get_num_threads();
    cout << "There are " << nthreads << " threads" << endl;
}
}
    return 0;
}

