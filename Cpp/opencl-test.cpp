//http://developer.amd.com/tools-and-sdks/heterogeneous-computing/amd-accelerated-parallel-processing-app-sdk/introductory-tutorial-to-opencl/

#include <utility>
#define __NO_STD_VECTOR // Use cl:vector instead of STL version
#include <CL/cl.hpp>

#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>
#include <iterator>

const std::string hw("Hello World\n");

inline void checkErr(cl_int err, const char * name) {
    if (err != CL_SUCCESS) {
        std::cerr << "ERROR: " << name
                  << " (" << err << ") " << std:endl;
        exit(EXIT_FAILURE);
    }
}

int main (void) {
    cl_int err;
    
    return 0;
}

