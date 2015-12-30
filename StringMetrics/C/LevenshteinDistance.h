#ifndef LevenshteinDistance
#define LevenshteinDistance

/* Recursive Levenshtein Distance. */
int recursiveLevenshteinDistance(char *string1, char *string2);

/* Iterative Levenshtein Distance. */
int itarativeLevenshteinDistance(char *string1, char *string2);


/* Levenshtein Distance with full matrix calculation. */
int fullMatrixLevenshteinDistance(char *string1, char *string2);

#endif