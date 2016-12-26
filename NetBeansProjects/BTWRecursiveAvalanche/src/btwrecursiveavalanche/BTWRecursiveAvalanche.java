package btwrecursiveavalanche;

/**
 *
 * @author Bozhin Karaivanov
 * Sep 29, 2012
 */
public class BTWRecursiveAvalanche {
    
    static int nx = 51;
    static int ny = 51;

    /**
     * @param args Not Used
     */
    public static void main(String[] args) {
        int NUMBER_OF_ITERATIONS=100;
        if (args.length < 3) {
            ShowHelp();
        }
        if (args.length > 0) {
            int num=NUMBER_OF_ITERATIONS;
            boolean ok=true;
            try {
                num = Integer.parseInt(args[0]);
            } catch (NumberFormatException e) {
                e.getMessage();
                ok = false;
            }
            if (ok) {
                NUMBER_OF_ITERATIONS = num;
            }
        }
        BTWModel model = new BTWModel(nx, ny, 600, 600, "btw-%1$08d.png", "PNG");
        System.out.println("NUMBER_OF_ITERATIONS = " + NUMBER_OF_ITERATIONS);
        for (int i = 0; i<NUMBER_OF_ITERATIONS; i++)
        {
            model.Update();
        }
        System.out.println();
        
    }
    
    public static void ShowHelp() {
        System.err.println("Usage: <program name> [<number-of-iterations> [<format> <type>]");
    }
}
