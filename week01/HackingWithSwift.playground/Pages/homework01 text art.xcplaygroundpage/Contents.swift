//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

for n in 1...100 {
    var t = "S"
    let randomNumber = Double.random(in: 0..<1)
    let gate = Double.random(in: 0.8..<1)
    if randomNumber > gate{t = "c"}
    if n % 10 == 0{
        print(t)
    } else {
        
        print(t, terminator: " ")
    }
//    print (t)
}
