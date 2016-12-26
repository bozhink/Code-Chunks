
    ' WK4PROG8.BAS
    ' Here is an interactive HI-LO
    ' Program

    'don't use a main window
    nomainwin

[start]
    guessMe = int(rnd(1)*100) + 1

    ' Clear the screen and print the title and instructions
    notice "HI-LO" + chr$(13) + _
     "I have decided on a number between one " + _
     "and a hundred, and I want you to guess " + _
     "what it is.  I will tell you to guess " + _
     "higher or lower, and we'll count up " + _
     "the number of guesses you use."

[ask]
    ' Ask the user to guess the number and tally the guess
    prompt "OK.  What is your guess ?"; guess$
    guess = val(guess$)

    ' Now add one to the count variable to count the guesses
    let count = count + 1

    ' check to see if the guess is right
    if guess = guessMe then goto [win]
    ' check to see if the guess is too low
    if guess < guessMe then notice "Guess higher."
    ' check to see if the guess is too high
    if guess > guessMe then notice "Guess lower."

    ' go back and ask again
    goto [ask]

[win]
    ' beep once and tell how many guesses it took to win
    beep
    notice "You win!  It took" + str$(count) + "guesses."

    ' reset the count variable to zero for the next game
    let count = 0

    ' ask to play again
    confirm "Play again (Y/N)?"; play$
    if instr("YESyes", play$) > 0 then goto [start]

    end
