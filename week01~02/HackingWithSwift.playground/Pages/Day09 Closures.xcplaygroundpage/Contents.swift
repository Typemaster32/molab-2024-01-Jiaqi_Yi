// Copying function:

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()
//When you’re copying a function, you don’t write the parentheses after it – it’s var greetCopy = greetUser and not var greetCopy = greetUser().


//Closure that look like a function
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}
//print(sayHello(name: "JJ"))
//error: Day09 Closures.xcplaygroundpage:16:15: error: extraneous argument label 'name:' in call
print(sayHello("JJ"))


//Copy a function by a closure:
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)
//with this, you don't have to call with label


//this is a simple closure:
let sayHello2 = {
    print("Hi there!")
}

sayHello2()

//another example
let payment = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}



//this is the hardest part:
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
print(captainFirstTeam)
//Here're my note:
//1. Understand that array.sorted() can go without input "array.sorted()", or "array.sorted(by:)" with an input of CLOSURE / FUNCTION as criteria.
//2. For the criteria, the closure / function has to have 2 inputs (elements from the array) and 1 outputs (bool).
//3.

//Here're the official notes:
//But first I want to break down what’s happening there:

//We’re calling the sorted() function as before.
//Rather than passing in a function, we’re passing a closure – everything from the opening brace after by: down to the closing brace on the last line is part of the closure.
//Directly inside the closure we list the two parameters sorted() will pass us, which are two strings. We also say that our closure will return a Boolean, then mark the start of the closure’s code by using in.
//Everything else is just normal function code.



//And this is the format of trailing closure syntax
let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
//even shorter:
let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
//$0 means the first input in a CLOSURE, and $2 means the second.
//this usually does not break the rule of certain quantity of input for a closure
//swift knows you're having 2 inputs here because of "sorted()".

//this is to put "Suzzane" at the first and others as usual.




//other usage:
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)
//the filter() function lets us run some code on every item in the array, and will send back a new array containing every item that returns TRUE for the function.
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
//the map() function lets us transform every item in the array using some code of our choosing, and sends back a new array of all the TRANSFORMED items

//review:If there is only one line of code, you can skip writing return
let numbers = [1,1,2,2,3]
let doubledNumbers = numbers.map { number in number * 2 }
print(doubledNumbers)


// Custom function accepting a closure
func customOperation(_ operation: (Int, Int) -> Int) -> Int {
    // Execute the closure with example inputs
    return operation(6, 3)
}

// Using the function with trailing closure syntax and shorthand parameters
let result = customOperation { $0 * $1 }
print(result) // Prints "18"

//let testClosure = {(p1:Int,p2:Int)->Int in $0 * $1}
//print(testClosure(8,8))

//let testClosure = { $0 * $1 }
//print(testClosure(8, 8)) // This will print "64" NO!  error: ambiguous use of operator '*'


// When using shorthand parameters you don't list the parameters you accept.
// In fact, trying to list the parameters will cause an error.
// Incorrect attempt that combines explicit parameter naming with shorthand parameters
//let testClosure: (Int, Int) -> Int = { (p1: Int, p2: Int) -> Int in $0 * $1 }
//error: anonymous closure arguments cannot be used inside a closure that has explicit arguments


let testClosure: (Int, Int) -> Int = { $0 * $1 }
print(testClosure(8, 8))
//this is now correct.


func performMathOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}
let result2 = performMathOperation(10, 5) { $0 + $1 }
print(result2)


//Putting function as input
func greetUser2() {
    print("Hi there!")
}
greetUser2()
var greetCopy: () -> Void = greetUser2
greetCopy()


func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
//here no matter a function or a closure, the generator can be each one of both as long as it's a "()->Int"

//trailing closure syntax
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)
