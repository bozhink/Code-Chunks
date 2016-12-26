[indent=4]
class Sample
    def run()
        stdout.printf("Hello, world!\n")

enum MyEnum
    FIRST_VALUE = 1
    SECOND_VALUE = 2

[Flags]
enum Colors
    RED
    GREEN
    BLUE
    YELLOW = RED | GREEN
    MAGENTA = RED | BLUE
    CYAN = GREEN | BLUE


init
    var sample = new Sample()
    sample.run()
    
    pi:double = Math.PI
    print pi.to_string()
    
    a:int = 1
    b:double = 3.5
    c:double = a + b
    print c.to_string()
    
    astr:string = """
Multi-line text
Examples of where this is useful are SQL and text menus"""
    print astr

    name:string = "Genie"
    print( "My name is %s", name )
    print( "My name is %s and everyone calls me %s", name, name )
    print( @"My name is $name" )
    print( @"My name is $name
You can call me $name
Two plus two is $(2 + 2)
The current date and time is: $( new DateTime.now_local() )" )


    if a > 0 
        print "a is greater than 0"
    else if a is 0
        print "a is equal to 0"
    else
        print "a is less than 0"
    

