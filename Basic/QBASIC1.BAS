PRINT "Hello, World!"
CLS
PRINT "Guess the number"
INPUT "Would you like to play? (Y/N>: ", choice$
choise$ = UCASE$(choice$)
IF choise$ = "YES" OR choice$ = "Y" THEN
guesses% = 5
RANDOMIZE TIMER
target% = INT(RND * 10) + 1
won% = 0
PRINT "The number is between 1 and 10."
WHILE guesses% > 0 AND won% = 0
INPUT "Enter your guess: ", guess%
IF guess% = target% THEN
PRINT "Correct, the answer was "; target%; "!"
won% = 1
ELSE
guesses% = guesses% - 1
PRINT "Sorry, please try again. You have"; guesses%; "guqsses left."
END IF
WEND
IF won% = 0 THEN PRINT "You ran out of guesses, the number was "; target%; "."
END IF

