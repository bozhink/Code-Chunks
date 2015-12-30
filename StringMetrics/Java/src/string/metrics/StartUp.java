package string.metrics;

public class StartUp {

    private static String string1 = "kitten";
    private static int length1 = string1.length();
    
    private static String string2 = "sitting";
    private static int length2 = string2.length();

    public static void main(String[] args) {

        LevenshteinDistance lev = new LevenshteinDistance();
        System.out.println(lev.toString());

        System.out.printf("%d\n", lev.calculateRecursively(string1, string2));
        
        System.out.printf("%d\n", lev.calculateIteratively(string1, string2));
        
        System.out.printf("%d\n", (lev.calculateFullMatrix(string1, string2))[length1][length2]);

    }

}
