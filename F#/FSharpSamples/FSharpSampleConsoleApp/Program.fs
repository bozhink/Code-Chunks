// simple types in one line
type Person = {FirstName:string; LastName:string}

// complex types in a few lines
type Employee = 
  | Worker of Person
  | Manager of Employee list

[<EntryPoint>]
let main argv = 
    printfn "%A" argv

    // one-liners
    [1..100] |> List.sum |> printfn "sum=%d"

    // no curly braces, semicolons or parentheses
    let square x = x * x
    let z = 42
    let sq = square z
    printfn "%d %d" z sq

    // type inference
    let jdoe = {FirstName="John";LastName="Doe"}
    let worker = Worker jdoe

    0 // return an integer exit code

