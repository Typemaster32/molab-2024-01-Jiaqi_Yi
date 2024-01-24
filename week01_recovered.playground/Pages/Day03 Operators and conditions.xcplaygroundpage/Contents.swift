//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)





//This is DIVISIONs:
let firstScore = 13
let secondScore = 4
// “/” 除 Devision
let divided = firstScore / secondScore
let divided2 :Double = 13 / 4
let divided3 :Double = Double(firstScore / secondScore)
//let divided3 :Double = firstScore / secondScore
//Replace 'firstScore / secondScore' with 'Double(firstScore / secondScore)'
// when Int / Int, u get Int; Double / Double, you get Double.
//3 商 Quotient
let remainder = 13 % secondScore
//1 余数 Remainder
// “%” 取余 Modulo

//let value: Double = 90000000000000001

let number = 465
let isMultiple = number.isMultiple(of: 7)


//This is PLUSes:
let fakers = "Fakers gonna "
let action = fakers + "fake"
//join strings
let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf
//also arrays
//let result = false + false
//NO BOOLs!

//Compound assignment operators:
var result = 21
result -= 11


//CONDITIONs:

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

//combine conditions
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

//The ternary operator (simplified if statement)
let firstCard2 = 11
let secondCard2 = 10
print(firstCard2 == secondCard2 ? "Cards are the same" : "Cards are different")

//Switch statetments
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")//required!
}

//Range operators
//For example, the range 1..<5 contains the numbers 1, 2, 3, and 4, whereas the range 1...5 contains the numbers 1, 2, 3, 4, and 5.
let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
//special usage:
let names = ["Piper", "Alex", "Suzanne", "Gloria","testname1","testname1","testname1"]
print(names[1...3])
print(names[1...])

var poorRating = 0...10
print(poorRating)
