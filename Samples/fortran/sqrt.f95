! A simple iterative computation of the square root

program iterative_square_root

real :: value, guess, next_guess

do      ! infinite loop until zero entered

print *, "Enter a number, zero (or negative) to stop:"
read *, value

if (value <= 0.0) stop

guess = set_exponent(value, exponent(value)/2)

  do
    next_guess = guess - (guess**2 - value)/(2*guess)
    print *, next_guess
    if (abs(guess - next_guess) > 5*epsilon(guess)*guess) then
      guess = next_guess
    else
      exit
    end if
  end do

  print *, "The square root of ", value, &
           " is approximately ", next_guess

end do
end program iterative_square_root
