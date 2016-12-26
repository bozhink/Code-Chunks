public class Sample : Object {
    private void greeting () {
        stdout.printf ("Hello World\n");
    }
    
    public static void main (string[] args) {
        var sample = new Sample ();
        sample.greeting ();
    }
}

