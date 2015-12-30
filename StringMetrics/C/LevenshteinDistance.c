#include "string.h"

/* Calculates minimum of two integers. */
int min(int x, int y) {
    return y ^ ((x ^ y) & -(x < y));
}

int tmin(int x, int y, int z) {
    return min(min(x ,y), z);
}

/* Recursive Levenshtein Distance. */
int rlev(char *s1, size_t len1, char *s2, size_t len2) {
    int cost, d1, d2, d;

    if (!strcmp(s1, s2)) {
        return 0;
    }

    if (!len1) {
        return len2;
    }

    if (!len2) {
        return len1;
    }

    if (s1[len1 - 1] == s2[len2 - 1]) {
        cost = 0;
    } else {
        cost = 1;
    }

    d1 = rlev(s1, len1 - 1, s2, len2) + 1;
    d2 = rlev(s1, len1, s2, len2 - 1) + 1;
    d = rlev(s1, len1 - 1, s2, len2 - 1) + cost;

    return tmin(d1, d2, d);
}

/* Iterative Levenshtein Distance. */
int ilev(char *s1, size_t len1, char *s2, size_t len2) {
    int cost;
    int i, j;
    int v0[len2 + 1];
    int v1[len2 + 1];

    if (!strcmp(s1, s2)) {
        return 0;
    }

    if (!len1) {
        return len2;
    }

    if (!len2) {
        return len1;
    }

    for (j = 0; j <= len2; ++j) {
        v0[j] = j;
    }

    for (i = 0; i < len1; ++i) {
        v1[0] = i + 1;

        for (j = 0; j < len2; ++j) {
            if (s1[i] == s2[j]) {
                cost = 0;
            } else {
                cost = 1;
            }
            
            v1[j + 1] = tmin(v1[j] + 1, v0[j + 1] + 1, v0[j] + cost);
        }

        for (j = 0; j <= len2; ++j) {
            v0[j] = v1[j];
        }
    }

    return v1[len2];
}

/* Levenshtein Distance with full matrix calculation. */
int fullMatrix(char *s1, size_t len1, char *s2, size_t len2) {
    int i, j;

    // Resultant matrix.
    int r[len1 + 1][len2 + 1];

    // Initialization
    for (i = 0; i <= len1; ++i) {
        r[i][0] = i;

        for (j = 0; j <= len2; ++j) {
            r[i][j] = 0;
        }
    }

    for (j = 0; j <= len2; ++j) {
        r[0][j] = j;
    }

    // Calculation
    for (j = 0; j < len2; ++j) {
        for (i = 0; i < len1; ++i) {
            if (s1[i] == s2[j]) {
                r[i + 1][j + 1] = r[i][j];
            } else {
                r[i + 1][j + 1] = tmin(r[i][j + 1] + 1, r[i + 1][j] + 1, r[i][j] + 1);
            }
        }
    }

    return r[len1][len2];
}

/* Recursive Levenshtein Distance. */
int recursiveLevenshteinDistance(char *string1, char *string2) {
    return rlev(string1, strlen(string1), string2, strlen(string2));
}

/* Iterative Levenshtein Distance. */
int itarativeLevenshteinDistance(char *string1, char *string2) {
    return ilev(string1, strlen(string1), string2, strlen(string2));
}

/* Levenshtein Distance with full matrix calculation. */
int fullMatrixLevenshteinDistance(char *string1, char *string2) {
    return fullMatrix(string1, strlen(string1), string2, strlen(string2));
}