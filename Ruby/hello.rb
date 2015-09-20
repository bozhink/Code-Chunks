# The Greeter class
class Greeter
    def initialize(name)
        @name = name.capitalize
    end
    
    def salute
        puts "Hello #{@name}!"
    end
end

# Create a new object
g = Greeter.new("world");

# Outputs "Hello World!"
g.salute

class Greeter
    attr_accessor :name
end

g.name = "Andy"

g.salute