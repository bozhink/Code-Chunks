#ifndef SANDPILE_PI_4_H
#include "sandpile_pi_4.h"
#endif /* SANDPILE_PI_4_H */

SandpilePi4::SandpilePi4(int _Z, int _L) {
    Z = _Z;
    L = _L;
    L1 = L + 1;
    reset = 0;
    init();
}

SandpilePi4::SandpilePi4(int alpha, int mu, int _L) {
    ALPHA = alpha;
    MU = mu;
    L = _L;
    L1 = L + 1;
    reset = 0;
    init();
}

SandpilePi4::~SandpilePi4() {
    finalize();
}

/*
 * Initialization method
 */
void SandpilePi4::init() {
    int i, j;
    /* Allocation of memory for lattice array */
    lattice = (unsigned**) malloc ( 2 * sizeof(unsigned*) );
    for (i=0; i<2; i++) {
        lattice[i] = (unsigned*) malloc ( L1 * sizeof(unsigned) );
    }
    if (!lattice) {
        fprintf(stderr, "%s: ERROR: Cannot allocate memory for lattice's array!\n");
        exit(3);
    }
    area = (int**) malloc( 2 * sizeof(int) );
    for (i=0; i<2; i++) {
        area[i] = (int*) malloc( L1 * sizeof(int) );
    }
    if (!area) {
        fprintf(stderr, "%s: ERROR: Cannot allocate memory for area array!\n");
        finalize();
        exit(3);
    }
    
    /* Randomization */
    for (i = 0; i < 2; i++) {
        for (j = 0; j < L1; j++) {
            lattice[i][j] = rand() % THRESHOLD;
            area[i][j] = 0;
        }
    }
    left = 0;
    right = L;
    ileft = left;
    iright = right;
    reset = 2 * L;
}

/*
 * Finalization method
 */
void SandpilePi4::finalize() {
    if (area) {
        for (int i = 0; i < 2; i++ ) {
            free(area[i]);
        }
        free(area);
        area = NULL;
    }
    if (lattice) {
        for (int i = 0; i < 2; i++) {
            free(lattice[i]);
        }
        free(lattice);
        lattice = NULL;
    }
}

/*
 * Randomization method
 */
void SandpilePi4::randomizeAll() {
    if (ileft > left) ileft = left;
    if (iright < right) iright = right;
    for (int i = 0; i < 2; i++) {
        for (int j = ileft; j <= iright; j++) {
            lattice[i][j]  = rand() % THRESHOLD;
        }
        for (int j=0; j<L1; j++) {
            area[i][j] = 0;
        }
    }
}

void SandpilePi4::randomize() {
    if (ileft > left) ileft = left;
    if (iright < right) iright = right;
    for (int j = ileft; j <= iright; j++) {
        row2[j]  = rand() % THRESHOLD;
        arow2[j] = 0;
    }
}

/*
 * alpha=1/Z, beta=1/Z, gamma=(Z-2)/Z
 */
void SandpilePi4::update() {
    s = 0;
    t = 0;
    
    randomizeAll();
    reset += 2*(iright-ileft) + 3;
    
    row1  = lattice[0];
    row2  = lattice[1];
    arow1 = area[0];
    arow2 = area[1];

    /* We start with a toppling in [0][0] position */
    row1[0] = THRESHOLD;
    a = 1;
    X = 1;
    
    ileft = 0;
    iright = 0;
    
    int i = 0;
    while ( updaterow(ileft, iright, &left, &right) && (++i < L1)) {
        t = i;
        for (int j = left; j <= right; j++) {
            a += arow2[j];
        }
        int x = right - left + 1;
        if (X < x) X = x;
        
        row1  = lattice[i % 2];
        row2  = lattice[(i+1) % 2];
        arow1 = area[i % 2];
        arow2 = area[(i+1) % 2];
        
        randomize();
        reset += iright - ileft + 2;
        
        ileft = left;
        iright = right;
    }
}


bool SandpilePi4::updaterow(int ileft, int iright, int*oleft, int*oright) {
    bool toppled = false;
    *oleft = iright+1;
    *oright = ileft;
    for (int j = ileft; j <= iright; j++) {
        int j1 = j+1;
        while (row1[j] >= THRESHOLD) {
            s++;
            toppled = true;
            row1[j] -= THRESHOLD;
            switch ( rand() % Z ) {
                case 0:
                    row2[j] += THRESHOLD;
                    arow2[j] = 1;
                    if (j < *oleft)  *oleft  = j;
                    if (j > *oright) *oright = j;
                    break;
                case 1:
                    row2[j1] += THRESHOLD;
                    arow2[j1] = 1;
                    if (j1 < *oleft)  *oleft  = j1;
                    if (j1 > *oright) *oright = j1;
                    break;
                default:
                    row2[j]  += THRESHOLD2;
                    row2[j1] += THRESHOLD2;
                    arow2[j] = 1;
                    arow2[j1] = 1;
                    if (j < *oleft)   *oleft  = j;
                    if (j1 > *oright) *oright = j1;
            }
        }
    }
    return toppled;
}

/*
 * mu = 1/MU, alpha=1/ALPHA
 */
void SandpilePi4::update1() {
    s = 0;
    t = 0;
    
    randomizeAll();
    reset += 2*(iright-ileft) + 3;
    
    row1  = lattice[0];
    row2  = lattice[1];
    arow1 = area[0];
    arow2 = area[1];

    /* We start with a toppling in [0][0] position */
    row1[0] = THRESHOLD;
    a = 1;
    X = 1;
    
    ileft = 0;
    iright = 0;
    
    int i = 0;
    while ( updaterow1(ileft, iright, &left, &right) && (++i < L1)) {
        t = i;
        for (int j = left; j <= right; j++) {
            a += arow2[j];
        }
        int x = right - left + 1;
        if (X < x) X = x;
        
        row1  = lattice[i % 2];
        row2  = lattice[(i+1) % 2];
        arow1 = area[i % 2];
        arow2 = area[(i+1) % 2];
        
        randomize();
        reset += iright - ileft + 2;
        
        ileft = left;
        iright = right;
    }
}


bool SandpilePi4::updaterow1(int ileft, int iright, int*oleft, int*oright) {
    bool toppled = false;
    *oleft = iright+1;
    *oright = ileft;
    
    for (int j = ileft; j <= iright; j++) {
        int j1 = j+1;
        while (row1[j] >= THRESHOLD) {
            s++;
            toppled = true;
            row1[j] -= THRESHOLD;
            
            switch (rand() % MU) {
                case 0:
                    switch (rand() % ALPHA) {
                        case 0:
                            row1[j] += 1;
                            row2[j] += THRESHOLD-1;
                            arow2[j] = 1;
                            if (j < *oleft)  *oleft  = j;
                            if (j > *oright) *oright = j;
                            break;
                        default:
                            row1[j] += 1;
                            row2[j1] += THRESHOLD-1;
                            arow2[j1] = 1;
                            if (j1 < *oleft)  *oleft  = j1;
                            if (j1 > *oright) *oright = j1;
                    }
                    break;
                default:
                    switch (rand() % ALPHA) {
                        case 0:
                            row2[j] += THRESHOLD;
                            arow2[j] = 1;
                            if (j < *oleft)  *oleft  = j;
                            if (j > *oright) *oright = j;
                            break;
                        default:
                            row2[j1] += THRESHOLD;
                            arow2[j1] = 1;
                            if (j1 < *oleft)  *oleft  = j1;
                            if (j1 > *oright) *oright = j1;
                    }
            }
        }
    }
    return toppled;
}
