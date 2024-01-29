//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName { //This is true
    print("It's \(friendName) vs \(ourName)")
}
//ChatGPT: When comparing two strings in Swift, the comparison is done based on Unicode values of characters in the strings
//That "" is an empty string: we start the string and end the string, with nothing in between.

//MULTIPLE CONDITIONS:
var temp = 40
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}
//And: && Or: ||

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}
//In this context, when you use .airplane, .helicopter, .bicycle, etc., Swift understands that these are cases of the TransportOption enum because transport is declared as a TransportOption type.

//ENUM vs SWITCH

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .snow {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}
//
//This is the same as:
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}
//Question: is it a MUST to have default?

//fallthrough:
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}
