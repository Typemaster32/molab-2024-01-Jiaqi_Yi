//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func check(_ target: [Int]?)->Int{guard let target = target else{return Int.random(in: 1...100)};return target.randomElement() ?? Int.random(in: 1...100)}

print(check([]))

print(check([1,2,3,4,5]))

print(check(nil))
