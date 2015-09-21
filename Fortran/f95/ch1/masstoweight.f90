program masstoweight
   ! This program calculates the weight of an object
   ! when is given its mass
   real, parameter :: g = 9.80665 ! acceleration
   real :: mass, weight
   print *, "Enter the mass in kg"
   read *, mass
   weight = mass * g
   print *, "The weight of an object with mass of ", &
      mass, " kg is equal to ", weight, " N."
endprogram masstoweight

