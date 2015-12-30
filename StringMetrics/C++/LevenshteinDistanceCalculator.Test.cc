#include <iostream>

#ifndef LevenshteinDistance
#include "LevenshteinDistanceCalculator.h"
#endif

char* String1 = "kitten";
char* String2  = "sitting";
int ExpextedLevenshteinDistance = 3;

using namespace std;
using namespace Strings;

int main(int argc, char ** argv) {
    LevenshteinDistanceCalculator calculator;

    cout << ExpextedLevenshteinDistance << ": " <<
        calculator.calculateRecursively(String1, String2) << endl;

    cout << ExpextedLevenshteinDistance << ": " <<
        calculator.calculateIteratively(String1, String2) << endl;

    cout << ExpextedLevenshteinDistance << ": " <<
        calculator.calculateWithFullMatrix(String1, String2) << endl;

    return 0;
}

