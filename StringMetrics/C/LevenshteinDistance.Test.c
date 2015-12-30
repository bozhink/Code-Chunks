#include "stdio.h"

#ifndef LevenshteinDistance
#include "LevenshteinDistance.h"
#endif

#define String1 "kitten"
#define String2 "sitting"
#define ExpextedLevenshteinDistance 3

int main(int argc, char **argv) {
    printf("%d, %d\n", ExpextedLevenshteinDistance,
        recursiveLevenshteinDistance(String1, String2));

    printf("%d, %d\n", ExpextedLevenshteinDistance,
        itarativeLevenshteinDistance(String1, String2));

    printf("%d, %d\n", ExpextedLevenshteinDistance,
        fullMatrixLevenshteinDistance(String1, String2));
}