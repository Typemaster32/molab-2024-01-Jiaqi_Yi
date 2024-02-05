//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}

func getRandomNumber2() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool2() -> some Equatable {
    Bool.random()
}

let a1=getRandomNumber()
let b1=getRandomNumber()
print(a1 == b1)
//true / false

let a2=getRandomNumber2()
let b2=getRandomNumber2()
print(a2 == b2)
//true / false
//Swift knows that behind the scenes they are actually two integers.


    
