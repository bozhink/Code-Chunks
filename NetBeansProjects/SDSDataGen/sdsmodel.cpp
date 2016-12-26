#include "sdsmodel.h"

#ifdef SDSMODEL_H

/*
 * *****************************************************************************
 *
 * Constrictors and destructor
 *
 * *****************************************************************************
 */

void SDSModel::construct(int lx, int ly)
{
    srand(time(NULL));
    s=0;
    t=0;
    Lx=lx;
    Ly=ly;
    Lmiddle=Lx/2;

    main_matrix = new unsigned* [Lx];
    for (int i=0; i<Lx; i++) main_matrix[i] = new unsigned[Ly];

    for (int i=0; i<Lx; i++)
        for (int j=0; j<Ly; j++)
            main_matrix[i][j] = 0;
    cerr << "Created SDSModel with sizes " << Lx << " by " << Ly << endl;
}

SDSModel::SDSModel () {
    construct(100, 100);
}

SDSModel::SDSModel (int latticeSize) {
    construct(latticeSize, latticeSize);
}

SDSModel::SDSModel (int latticeSizeX, int latticeSizeY) {
    construct(latticeSizeX, latticeSizeY);
}

SDSModel::~SDSModel() {
    for (int i=0; i<Lx; i++)
        delete [] main_matrix[i];
    delete [] main_matrix;
    cerr << "Deleted SDSModel with size " << Lx << " by " << Ly << endl;
}

/*
 * *****************************************************************************
 *
 * Update mathods
 *
 * *****************************************************************************
 */

/*
 * Recursive update method
 */
void SDSModel::update (int x, int y)
{
    t -= ((t-y-1) & ((t-y-1)>>31)); /* Updating t: t=max(t,y+1) */

    if (main_matrix[x][y] >= Z_CRITICAL)  /* toppling */
    {
        s++; /* If there is toppling then size s is incremented */

        main_matrix[x][y] -= Z_CRITICAL;

        if (y+1>=Ly) {
            return; /* Open boudary condition */
        } else {
            /* Our grain of energy is not on the boundary */
            /* Here goes stochatic part */
            /* Nonexclusive, NESDS */

            y++;
            x += (Lx-1);

            int x1 = (x + rand() % 3) % Lx;
            int x2 = (x + rand() % 3) % Lx;

            main_matrix[x1][y]++;
            main_matrix[x2][y]++;

            update(x1, y);
            update(x2, y);
        }
    }
}

/*
 * Non-recursive update method
 */
void SDSModel::Update() {
    int x, y;
    int x1, x2, y1, y2, Lx1, Ly1;
    t=1;
    s=0;
    Lx1 = Lx-1;
    Ly1 = Ly-1;
    for (y=0; y<Ly-1; y++)  // Scan all rows but the last one
    {
        y1 = y + 1;
        y2 = y1 + 1;
        for (x=0; x<Lx; x++) // Scan all elements in the current row
        {
            while (main_matrix[x][y] >= Z_CRITICAL) // Toppling
            {
                t -= ((t-y2) & ((t-y2)>>31)); /* Updating t: t=max(t,y2) */
                s++;
                /* Periodic boundary conditions in x-direction */
                x1 = (x + Lx1 + rand()%3) % Lx;
                x2 = (x + Lx1 + rand()%3) % Ly;
                main_matrix[x][y] -= Z_CRITICAL;
                main_matrix[x1][y1]++;
                main_matrix[x2][y1]++;
            }
        }
    }
    // Scan all elements in the last row. Open boundary condition
    for (x=0; x<Lx; x++)
    {
        while (main_matrix[x][Ly1] >= Z_CRITICAL) // Toppling
        {
            s++;
            main_matrix[x][Ly1] -= Z_CRITICAL;
        }
    }
}
//void SDSModel::Update() {
//    int x, y;
//    int x1, x2, y1, Lx1, Ly1;
//    bool isToppled;
//    t=0;
//    s=0;
//    Lx1 = Lx-1;
//    Ly1 = Ly-1;
//    isToppled = true;
//    while (isToppled)
//    {
//        isToppled = false;
//        for (y=0; y<Ly-1; y++) { // Scan all rows but the last one
//            y1 = y+1;
//            for (x=0; x<Lx; x++) { // Scan all elements in the current row
//                if (main_matrix[x][y] >= Z_CRITICAL) { // Toppling
//                    isToppled = true;
//                    t -= ((t-y1) & ((t-y1)>>31)); /* Updating t: t=max(t,y1) */
//                    s++;
//                    /* Periodic boundary conditions in x-direction */
//                    x1 = (x + Lx1 + rand()%3) % Lx;
//                    x2 = (x + Lx1 + rand()%3) % Ly;
//
//                    main_matrix[x][y] -= Z_CRITICAL;
//                    main_matrix[x1][y1]++;
//                    main_matrix[x2][y1]++;
//                }
//            }
//
//        }
//        // Scan all elements in the last row. Open boundary condition
//        for (x=0; x<Lx; x++) {
//            if (main_matrix[x][Ly1] >= Z_CRITICAL) { // Toppling
//                isToppled = true;
//                s++;
//                main_matrix[x][Ly1] -= Z_CRITICAL;
//            }
//
//        }
//    }
//
//}
/*
 * *****************************************************************************
 *
 * Data obtaining functions
 *
 * *****************************************************************************
 */

int SDSModel::Get_s() {
    return s;
}

int SDSModel::Get_t() {
    return t;
}

void SDSModel::GetSize(int *X, int *Y) {
    *X = Lx;
    *Y = Ly;
}

double SDSModel::GetEnergy() {
    double e=0.0;
    for (int i=0; i<Lx; i++) {
        for (int j=0; j<Ly; j++) {
            e += (double) main_matrix[i][j];
        }
    }
    return e;
}

double SDSModel::GetEnergy1() {
    double e=0.0;
    for (int i=0; i<Lx-1; i++) {
        for (int j=0; j<Ly; j++) {
            e += (double) main_matrix[i][j];
        }
    }
    return e;
}

/*
 * *****************************************************************************
 *
 * Next Step functions
 *
 * *****************************************************************************
 */
void SDSModel::NextStep()
{
    s=0;
    t=1;
    main_matrix[Lmiddle][0] = 2;
    update(Lmiddle, 0);
}

void SDSModel::UNextStep()
{
    s=0;
    t=1;
    main_matrix[Lmiddle][0] ++;
    Update();
}

/*
 * *****************************************************************************
 *
 * Termalization functions
 *
 * *****************************************************************************
 */

void SDSModel::Randomize()
{
    for (int x=0; x<Lx; x++)
        for (int y=0; y<Ly; y++)
            main_matrix[x][y] = rand() % 2;
}


#endif /* SDSMODEL_H */
