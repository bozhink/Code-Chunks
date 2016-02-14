package jsandpilemodel;

/**
 *
 * @author bozhin
 */
public class SandPile 
{
    private int nx;
    private int ny;
    private int array[][];
    
    private int maxPileHeight; // threshold height
    private int underflowHeight;
    private int underflowWidth;
    
    public SandPile()
    {
    	nx = 10;
    	ny = 10;
    	array = new int[nx][ny];
        maxPileHeight = 1;
        underflowHeight = 2;
        underflowWidth = 2;
        for (int i=0; i<nx; i++)
        {
            for (int j=0; j<ny; j++)
            {
                array[i][j] = 0;
            }
        }
    }
    
    public SandPile(int nx, int ny)
    {
    	this.nx = nx;
    	this.ny = ny;
    	array = new int[nx][ny];
        maxPileHeight = 1;
        underflowHeight = 2;
        underflowWidth = 2;
        for (int i=0; i<nx; i++)
        {
            for (int j=0; j<ny; j++)
            {
                array[i][j] = 0;
            }
        }
    }
    
    public int GetWidth()
    {
    	return nx;
    }
    
    public int GetHeight()
    {
    	return ny;
    }
    
    public int GetElement(int x, int y)
    {
        return array[x][y];
    }
    
    public void Step()
    {
        int initialPosition = (int) (nx*Math.abs(Math.random()));
        //System.err.println("SandPile.Step: initialPosition = " + initialPosition);
        array[0][initialPosition]++;
        DoUpdate(0, initialPosition);
    }
    
    private void DoUpdate(int x, int y)
    {
        if (array[x][y] <= maxPileHeight)
        {
            return;
        }
        if (x>=nx-1)
        {
            array[x][y] -= underflowHeight;
            return;
        }
        int xx = x+1;
        int y1, y2;
        y1 = (y + ny) % ny;
        y2 = (y + 1 + ny) % ny;
        //System.err.println(y1 + "\t" + y2);
        
        array[x][y] -= underflowHeight;
        array[xx][y1]++;
        array[xx][y2]++;
        DoUpdate(xx,y1);
        DoUpdate(xx,y2);
    }
}
