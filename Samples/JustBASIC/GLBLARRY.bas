'fill and display an array with a random quantity of
'numbers
dim numbers(100)
count = fillRandomly()
for x = 1 to count
    print numbers(x)
next x
end

function fillRandomly()
    fillRandomly = int(rnd(1)*100)+1
    for x = 1 to fillRandomly
        numbers(x) = int(rnd(1)*fillRandomly)+1
    next x
end function

