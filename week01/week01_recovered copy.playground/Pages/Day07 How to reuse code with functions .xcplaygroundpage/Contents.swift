//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//FUNCTION

func printTimesTables(number: Int) {//func; parameter declaired from the start.
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

//printTimesTables(number: 5)
//number:parameter (placeholder) 5:argument (actual value)


func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}
//When trying to return something, don't forget "->"
func areLettersIdentical2(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
//when a function has only one line of code, we can remove the return keyword entirely.

let isAdmin = true
let isOwner = false
let isEditingEnabled = false
isOwner == true && isEditingEnabled || isAdmin == true
//In Swift, as in many programming languages, logical AND (&&) operators have higher precedence than logical OR (||) operators. Therefore, the operations in your expression are evaluated in the following sequence:
//
//Comparison Operations: The == operators are evaluated first.
//isOwner == true evaluates to false (since isOwner is false).
//isAdmin == true evaluates to true (since isAdmin is true).
//Logical AND Operation: The && operator is evaluated next.
//false && isEditingEnabled evaluates to false (since false && false is false).
//Logical OR Operation: Finally, the || operator is evaluated.
//false || true evaluates to true (since false || true is true).
//So, the overall sequence of evaluation is:
//
//First, each == operation is evaluated.
//Then, the result of isOwner == true is combined with isEditingEnabled using &&.
//Finally, the result of the previous step (false) is combined with the result of isAdmin == true using ||.
//The final result of the entire expression is true.


//Sometimes you have to use TERNARY OPERATOR:
func greet(name: String) -> String {
    if name == "Taylor Swift" {
        "Oh wow!"
    } else {
        "Hello, \(name)"
    }
}
//not allowed
func greet2(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}
//proper version



//Returning Multiple Values:

//Array:
//func getUser() -> [String] {
//    ["Taylor", "Swift"]
//}
//
//let user = getUser()
//print("Name: \(user[0]) \(user[1])")

//Dictionary: (default???)
//func getUser() -> [String: String] {
//    [
//        "firstName": "Taylor",
//        "lastName": "Swift"
//    ]
//}
//
//let user = getUser()
//print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")

//tuple:
//func getUser() -> (firstName: String, lastName: String) {
//    (firstName: "Taylor", lastName: "Swift")
//}
//Or:
//First, if you’re returning a tuple from a function, Swift already knows the names you’re giving each item in the tuple, so you don’t need to repeat them when using return. So, this code does the same thing as our previous tuple:
func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let user = getUser()
//Or:
let (firstName, lastName) = getUser()

print("Name: \(user.firstName) \(user.lastName)")
//Or:
print("Name: \(user.0) \(user.1)")
//QUESTION: tuple with no name for elements?

