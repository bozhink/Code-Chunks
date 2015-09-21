#include <stdio.h>
#include <stdlib.h>
#define MAXIMAL_SIZE 1000000

int main (int argc, char**argv) {
    
    int L = 0, i;
    unsigned *histogram;
    unsigned k;
    FILE*fp;
    
    if (argc < 3) {
        fprintf(stderr, "Usage: %s <maximal value> <input file name>\n", argv[0]);
        return 1;
    }
    
    L = atoi(argv[1]);
    if (!(L > 0 && L < MAXIMAL_SIZE)) {
        return 2;
    }
    
    if (!(fp=fopen(argv[2],"r"))) {
        return 3;
    }
    
    histogram = (unsigned*)malloc(L*sizeof(unsigned));
    
    for (i=0; i<L; i++) histogram[i] = 0;
    while (!feof(fp)) {
       fscanf(fp, "%d", &k);
       histogram[k] += 1;
    }
    
    fclose(fp);
    
    for (i=0; i<L; i++) {
       if (histogram[i]) printf("%d %d\n", i, histogram[i]);
    }
    
    free(histogram);
    
}

