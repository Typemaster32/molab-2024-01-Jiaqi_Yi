//: [Previous](@previous)

import Foundation

//var greeting = "Hello, playground"

//: [Next](@next)
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let filteredNumbers=luckyNumbers.filter{$0 % 2 != 0}
let sortedNumbers=filteredNumbers.sorted();
for n in sortedNumbers{
    print ("\(n) is a lucky number")
}
