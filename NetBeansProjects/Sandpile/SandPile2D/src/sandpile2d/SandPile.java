package sandpile2d;

/**
 *
 * @author bozhin
 */
public class SandPile 
{
    private int dimx;
    private int dimy;
    private int [][] array;
    private int threshold = 4;
    private int underflowHeight = 4;
    
    private int recursionDepth = 10;
    
    private void init()
    {
        for (int i=0; i<dimx; i++)
        {
            for (int j=0; j<dimy; j++)
            {
                array[i][j]=0;
            }
        }
    }
    
    public SandPile()
    {
        dimx = 10;
        dimy = 10;
        array = new int[dimx][dimy];
        init();
    }
    
    /**
     * Creates a Sand Pile Model Object of size nx x ny
     * @param nx x-dimension of the model's matrix
     * @param ny y-dimension of the model's matrix
     */
    public SandPile(int nx, int ny)
    {
        dimx = nx;
        dimy = ny;
        array = new int[dimx][dimy];
        init();
    }
    
    private boolean stopRecursion = false;
    
    private void Update(int x, int y, int recursionNumber)
    {
        stopRecursion = false;
        if (recursionNumber > recursionDepth)
        {
            stopRecursion = true;
            return;
        }
        if (array[x][y] >= threshold)
        {
            int xm1 = (x-1+dimx) % dimx;
            int xp1 = (x+1+dimx) % dimx;
            int ym1 = (y-1+dimy) % dimy;
            int yp1 = (y+1+dimy) % dimy;
            array[x][y] -= underflowHeight;
            array[xm1][y]++;
            array[xp1][y]++;
            array[x][ym1]++;
            array[x][yp1]++;
            Update(xm1, y, recursionNumber + 1);
            if (stopRecursion) { return; }
            Update(xp1, y, recursionNumber + 1);
            if (stopRecursion) { return; }
            Update(x, ym1, recursionNumber + 1);
            if (stopRecursion) { return; }
            Update(x, yp1, recursionNumber + 1);
            if (stopRecursion) { return; }
        }
    }
    
    private void Update(int x, int y)
    {
        if (array[x][y] >= threshold)
        {
            int xm1 = (x-1+dimx) % dimx;
            int xp1 = (x+1+dimx) % dimx;
            int ym1 = (y-1+dimy) % dimy;
            int yp1 = (y+1+dimy) % dimy;
            array[x][y] -= underflowHeight;
            array[xm1][y]++;
            array[xp1][y]++;
            array[x][ym1]++;
            array[x][yp1]++;
        }
    }
    
    public void Step()
    {
        int x = (int) (Math.abs(dimx*Math.random()));
        int y = (int) (Math.abs(dimy*Math.random()));
        array[x][y]++;
        stopRecursion = false;
        while (true)
        {
            Update(x,y,0);
            if (stopRecursion)
            {
                for (int i=0; i<dimx; i++)
                {
                    for (int j=0; j<dimy; j++)
                    {
                        Update(i,j);
                    }
                }
            }
            else
            {
                break;
            }
        }
    }
    
    public int GetElement(int x, int y)
    {
        return array[x][y];
    }
}
