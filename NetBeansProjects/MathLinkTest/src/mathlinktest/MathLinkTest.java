package mathlinktest;

/**
 *
 * @author bozhin
 */
public class MathLinkTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
    public static int AddTwo(int i, int j) {
        return i+j;
    }
    
    public static double GetSum(double [] arg) {
        double result=0;
        for (int i=0; i<arg.length; i++) {
            result += arg[i];
        }
        return result;
    }
    
    public static double GetSum(double [][] arg) {
        double result=0;
        for (int i=0; i<arg.length; i++) {
            for (int j=0; j<arg[i].length; j++) {
                result += arg[i][j];
            }
        }
        return result;
    }
}
