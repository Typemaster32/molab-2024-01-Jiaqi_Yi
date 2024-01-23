//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//How to make a mixed-type set?
//check ChatGPT's answer:

//var mixedSet: Set<Any> = []
//Type 'Any' does not conform to protocol 'Hashable'
//mixedSet.insert(1)         // an Int
//mixedSet.insert("Hello")   // a String
//mixedSet.insert(3.14)      // a Double


//this is weird:
//struct AnyHashableValue: Hashable {
//    let value: AnyHashable
//
//    init<T: Hashable>(_ value: T) {
//        self.value = AnyHashable(value)
//    }
//}
//
//var mixedSet: Set<AnyHashableValue> = [
//    AnyHashableValue(1),     // an Int
//    AnyHashableValue("Hello"), // a String
//    AnyHashableValue(3.14)   // a Double
//]
//
// Now mixedSet contains an Int, a String, and a Double wrapped in AnyHashableValue
//print(mixedSet)

