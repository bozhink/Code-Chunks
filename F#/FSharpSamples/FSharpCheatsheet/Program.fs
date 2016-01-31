// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.
// See http://dungpa.github.io/fsharp-cheatsheet/

(*
    This is block comment
     *)

// And this is line comment

// XML doc comments come after /// allowing us to use XML tags to generate documentation.

/// The `let` keyword defines an (immutable) value
let result = 1 + 1 = 2

// F# string type is an alias for System.String type.
/// Create a string using string concatenation
let hello = "Hello" + " World"

// Use verbatim strings preceded by @ symbol to avoid escaping control characters (except escaping " by "").
let verbatimXml = @"<book title=""Paradise Lost"">"

// We don't even have to escape " with triple-quoted strings.
let tripleXml = """<book title="Paradise Lost">"""

// Backslash strings indent string contents by stripping leading spaces.
let poem =
    "The lesser world was daubed\n\
     By a colorist of modest skill\n\
     A master limned you in the finest inks\n\
     And with a fresh-cut quill."

// Most numeric types have associated suffixes, e.g., uy for unsigned 8-bit integers and L for signed 64-bit integer.
let b, i, l = 86uy, 86, 86L
(*
val b : byte = 86uy
val i : int = 86
val l : int64 = 86L
*)

// Other common examples are F or f for 32-bit floating-point numbers, M or m for decimals, and I for big integers.
let s, f, d, bi = 4.14F, 4.14, 0.7833M, 9999I
(*
val s : float32 = 4.14f
val f : float = 4.14
val d : decimal = 0.7833M
val bi : System.Numerics.BigInteger = 9999
*)

// The let keyword also defines named functions.
let negate x = x * -1
let square x = x * x
let print x = printfn "The number is: %d" x

let squareNegateThenPrint x =
    print (negate (square x))

// Pipe and composition operators

// Pipe operator |> is used to chain functions and arguments together.
// Double-backtick identifiers are handy to improve readability especially in unit testing:
let ``square, negate, then print`` x =
    x |> square |> negate |> print

// This operator is essential in assisting the F# type checker by providing type information before use:
let sumOfLengths (xs : string []) =
    xs
    |> Array.map (fun s -> s.Length)
    |> Array.sum

// Composition operator >> is used to compose functions:
let squareNegateThenPrint' =
    square >> negate >> print

// The rec keyword is used together with the let keyword to define a recursive function:
let rec fact x =
    if x < 1 then 1
    else x * fact (x - 1)

// Mutually recursive functions (those functions which call each other) are indicated by and keyword:
let rec even x =
   if x = 0 then true
   else odd (x - 1)

and odd x =
   if x = 1 then true
   else even (x - 1)

// Pattern Matching

// Pattern matching is often facilitated through match keyword.
let rec fib n =
    match n with
    | 0 -> 0
    | 1 -> 1
    | _ -> fib (n - 1) + fib (n - 2)

// In order to match sophisticated inputs, one can use when to create filters or guards on patterns:
let sign x =
    match x with
    | 0 -> 0
    | x when x < 0 -> -1
    | x -> 1

// Pattern matching can be done directly on arguments:
let fst' (x, _) = x

// or implicitly via function keyword:
/// Similar to `fib`; using `function` for pattern matching
let rec fib' = function
    | 0 -> 0
    | 1 -> 1
    | n -> fib' (n - 1) + fib' (n - 2)

// Collections

// Lists
// A list is an immutable collection of elements of the same type.

// Lists use square brackets and `;` delimiter
let list1 = [ "a"; "b" ]

// :: is prepending
let list2 = "c" :: list1

// @ is concat
let list3 = list1 @ list2

// Recursion on list using (::) operator
let rec sum list =
    match list with
    | [] -> 0
    | x :: xs -> x + sum xs

// Arrays
// Arrays are fixed-size, zero-based, mutable collections of consecutive data elements.

// Arrays use square brackets with bar
let array1 = [| "a"; "b" |]

// Indexed access using dot
let first = array1.[0]

// Sequences
// A sequence is a logical series of elements of the same type.
// Individual sequence elements are computed only as required,
// so a sequence can provide better performance than a list in situations in which not all the elements are used.

// Sequences can use yield and contain subsequences
let seq1 =
    seq {
        // "yield" adds one element
        yield 1
        yield 2

        // "yield!" adds a whole subsequence
        yield! [5..10]
    }

// Higher-order functions on collections
// The same list [ 1; 3; 5; 7; 9 ] or array [| 1; 3; 5; 7; 9 |] can be generated in various ways.

// Using range operator ..
let xs = [ 1..2..9 ]

// Using list or array comprehensions
let ys = [| for i in 0..4 -> 2 * i + 1 |]

// Using init function
let zs = List.init 5 (fun i -> 2 * i + 1)

// Lists and arrays have comprehensive sets of higher-order functions for manipulation.

// fold starts from the left of the list (or array) and foldBack goes in the opposite direction
let xs' = Array.fold (fun str n ->
            sprintf "%s,%i" str n) "" [| 0..9 |]

// reduce doesn't require an initial accumulator
let last xs = List.reduce (fun acc x -> x) xs

// map transforms every element of the list (or array)
let ys' = Array.map (fun x -> x * x) [| 0..9 |]

// iter-ate through a list and produce side effects
let _ = List.iter (printfn "%i") [ 0..9 ]

// All these operations are also available for sequences.
// The added benefits of sequences are laziness and uniform treatment of all collections implementing IEnumerable<'T>.
let zs' =
    seq { 
        for i in 0..9 do
            printfn "Adding %d" i
            yield i
    }

// Tuples and Records


[<EntryPoint>]
let main argv =
    printfn "%A" argv
    printfn "%A" list1
    printfn "%A" list2
    printfn "%A" list3
    printfn "%A" xs
    printfn "%A" poem
    ``square, negate, then print`` 10
    squareNegateThenPrint' 10
    fact 5 |> print
    0 // return an integer exit code