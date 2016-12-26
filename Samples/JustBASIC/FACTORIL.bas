

    'print the factorial of n
    input "Factorial of?"; n

    print factorial(n)
    end

function factorial(n)
    if n = 1 then
        factorial = n
    else
        factorial = n * factorial(n-1)
    end if
end function


