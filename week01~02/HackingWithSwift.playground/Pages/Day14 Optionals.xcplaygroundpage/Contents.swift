//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}
//This if let syntax is very common in Swift, and combines creating a condition (if) with creating a constant (let). Together, it does three things:
//It reads the optional value from the dictionary.
//If the optional has a string inside, it gets unwrapped – that means the string inside gets placed into the marioOpposite constant.
//The condition has succeeded – we were able to unwrap the optional – so the condition’s body is run.

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}
//example of how "if-let" triggers the optional

func square(num: Int) -> Int {
    num * num
}

//var numberz: Int? = nil//WHAT DOES IT MEAN?
var number: Int? = 10
//print(square(num: number))




if let number = number {//this has to be used with "var number: Int? = 10".
    //"var number=1" is not OK
    print(square(num: number))
}
//this causes errors
//
//func square(number: Int) -> Int {
//    return number * number
//}
//
// Assuming 'number' is an optional Int that could be nil
//var number2: Int? = 10
//
// Safely unwrapping the optional 'number' using 'if let'
//if let number2 = number2 {
//    print(square(num: number2))
//} else {
//    print("Number is nil, so it cannot be squared.")
//}




//GUARD LET:
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}

//var myVar: Int? = 3

//if let unwrapped = myVar {
//    print("Run if myVar has a value inside")
//}

//guard let unwrapped = myVar else {
//    print("Run if myVar doesn't have a value inside")
//}

//CHECK THESE THREEE ABOVE



//So, if let runs the code inside its braces if the optional had a value, and guard let runs the code inside its braces if the optional didn’t have a value. This explains the use of else in the code: “check that we can unwrap the optional, but if we can’t then…”


func printSquare2(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}
//Regarding your third point, it seems there's a slight misunderstanding. The key feature of the guard statement is that it ensures certain conditions are met before proceeding with the execution of the code that follows it. The unwrapped number is available after the guard statement, not before. Therefore, you cannot use the unwrapped number before the guard statement or within its else block. The correct and safe usage of the unwrapped number (ensured to be non-nil) is after the guard block, as shown in your function.


let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"]
let new2 = captains["Serenity"] ?? "N/A"
let new3 = captains["Serenity", default: "N/A"]
//all the same!



//Optional Chaining:

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)




enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}


let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)
//what's the difference with ternary?

