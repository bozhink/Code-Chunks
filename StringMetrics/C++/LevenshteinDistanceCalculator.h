#ifndef LevenshteinDistance
#define LevenshteinDistance

namespace Strings {

    class LevenshteinDistanceCalculator {
        int min(int, int);
        int min(int, int, int);
        int rlev(char*, size_t, char*, size_t);
        int ilev(char*, size_t, char*, size_t);
        int fullMatrix(char*, size_t, char*, size_t);

    public:
        int calculateRecursively(char*, char*);
        int calculateIteratively(char*, char*);
        int calculateWithFullMatrix(char*, char*);
    };

}

#endif