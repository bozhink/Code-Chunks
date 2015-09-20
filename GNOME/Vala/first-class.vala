// First Class
/* class derived from GOject */
public class BasicSample : Object
{
    /* public instance method */
    public void run ()
    {
        stdout.printf ("Hello, World!\n");
    }
}

/* application entry point */
int main (string[] args)
{
    // instantiate this class, assigning the instace to
    // a type-inferred variable
    var sample = new BasicSample ();
    // call the run method
    sample.run ();
    // return from this main method
    return 0;
}

/*
The entry point may as well be inside the class, if you prefer it this way:

public class BasicSample : Object {

    public void run () {
        stdout.printf ("Hello World\n");
    }

    static int main (string[] args) {
        var sample = new BasicSample ();
        sample.run ();
        return 0;
    }
}

In this case main must be declared static.
*/
