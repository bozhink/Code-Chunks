package dislin.test;
import de.dislin.Dislin;

/**
 *
 * @author bozhin
 */
public class DislinTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int i, j, k, ii, nl, nx, ny, nx0 = 335, ny0 = 350, iclr = 0;
        int ix [] = {0, 400, 400, 0};
        int iy [] = {0, 0, 400, 400};
        int ixp [] = {0, 0, 0, 0};
        int iyp [] = {0, 0, 0, 0};
        String ctit = "Shading Pattrns (AREAF)";
        
        Dislin.metafl("cons");
        Dislin.disini();
        Dislin.setvlt ("small");
        //Dislin.pagera(); // sets border
        Dislin.complx();
        
        /*
         * Set title characterisitics
         */
        //Dislin.height(50);
        //nl = Dislin.nlmess(ctit);
        //Dislin.messag(ctit, (2970-nl) / 2, 200);
        /*
         * Title is done
         */
        
        for (i = 0; i < 3; i++) {
            ny = ny0 + i*400;
            for (j = 0; j < 6; j++) {
                nx = nx0 + j*400;
                //ii = i * 6 + j;
                //Dislin.shdpat(ii);
                Dislin.shdpat(16);
                iclr++;
                Dislin.setclr (iclr);
                for (k = 0; k < 4; k++) {
                    ixp[k] = ix[k] + nx;
                    iyp[k] = iy[k] + ny;
                }
                
                Dislin.areaf (ixp, iyp, 4);
                //nl = Dislin.nlnumb (ii, -1);
                //nx = nx + (300 - nl) / 2;
                Dislin.color("foreground");
                //Dislin.number (ii, -1, nx, ny + 460);
            }
        }
        Dislin.disfin();
    }
}
