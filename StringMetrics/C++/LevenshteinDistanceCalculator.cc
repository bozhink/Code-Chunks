#include <cstring>

#ifndef LevenshteinDistance
#include "LevenshteinDistanceCalculator.h"
#endif

using namespace Strings;

/* Calculates minimum of two integers. */
int LevenshteinDistanceCalculator::min(int x, int y) {
    return y ^ ((x ^ y) & -(x < y));
}

/* Calculates minimum of three integers. */
int LevenshteinDistanceCalculator::min(int x, int y, int z) {
    return min(min(x ,y), z);
}

/* Recursive Levenshtein Distance. */
int LevenshteinDistanceCalculator::rlev(char *s1, size_t len1, char *s2, size_t len2) {
    if (!strcmp(s1, s2)) {
        return 0;
    }

    if (!len1) {
        return len2;
    }

    if (!len2) {
        return len1;
    }

    int cost = (s1[len1 - 1] == s2[len2 - 1]) ? 0 : 1;

    int d1 = rlev(s1, len1 - 1, s2, len2) + 1;
    int d2 = rlev(s1, len1, s2, len2 - 1) + 1;
    int d = rlev(s1, len1 - 1, s2, len2 - 1) + cost;

    return min(d1, d2, d);
}

/* Iterative Levenshtein Distance. */
int LevenshteinDistanceCalculator::ilev(char *s1, size_t len1, char *s2, size_t len2) {
    if (!strcmp(s1, s2)) {
        return 0;
    }

    if (!len1) {
        return len2;
    }

    if (!len2) {
        return len1;
    }

    int v0[len2 + 1];
    int v1[len2 + 1];

    for (int j = 0; j <= len2; ++j) {
        v0[j] = j;
    }

    for (int i = 0; i < len1; ++i) {
        v1[0] = i + 1;

        for (int j = 0; j < len2; ++j) {
            int cost = (s1[i] == s2[j]) ? 0 : 1;
            v1[j + 1] = min(v1[j] + 1, v0[j + 1] + 1, v0[j] + cost);
        }

        for (int j = 0; j <= len2; ++j) {
            v0[j] = v1[j];
        }
    }

    return v1[len2];
}

/* Levenshtein Distance with full matrix calculation. */
int LevenshteinDistanceCalculator::fullMatrix(char *s1, size_t len1, char *s2, size_t len2) {
    int r[len1 + 1][len2 + 1];

    // Initialization
    for (int i = 0; i <= len1; ++i) {
        r[i][0] = i;

        for (int j = 0; j <= len2; ++j) {
            r[i][j] = 0;
        }
    }

    for (int j = 0; j <= len2; ++j) {
        r[0][j] = j;
    }

    // Calculation
    for (int j = 0; j < len2; ++j) {
        for (int i = 0; i < len1; ++i) {
            if (s1[i] == s2[j]) {
                r[i + 1][j + 1] = r[i][j];
            } else {
                r[i + 1][j + 1] = min(r[i][j + 1] + 1, r[i + 1][j] + 1, r[i][j] + 1);
            }
        }
    }

    return r[len1][len2];
}

int LevenshteinDistanceCalculator::calculateRecursively(char* string1, char* string2) {
    return rlev(string1, strlen(string1), string2, strlen(string2));
}

int LevenshteinDistanceCalculator::calculateIteratively(char* string1, char* string2) {
    return ilev(string1, strlen(string1), string2, strlen(string2));
}

int LevenshteinDistanceCalculator::calculateWithFullMatrix(char* string1, char* string2) {
    return fullMatrix(string1, strlen(string1), string2, strlen(string2));
}
