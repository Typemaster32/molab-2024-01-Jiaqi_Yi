//: [Previous](@previous)

import Foundation

//: [Next](@next)

//This is an array
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"
let beatles = [john, paul, george, ringo]

//This is an array(mixed type)
let mixedArray: [Any] = [1, "Hello", 3.14]

//This is an array with TYPE ANNOTATION
var results = Array<Int>()
//or:
var results2 = [Int]()
//not:
//var results3 = Array[Int]()


//This is a set
let mySet: Set = [1, 2, 3, 4, 5]
let randomElement = mySet.randomElement()

//This is a set with TYPE ANNOTATION:
//CAUTION: ALL must use <> angle brackets to do type annotation for set.
//only array and dictionary can use [] square brackets.
//array and dictionary can also use <> angle brackets: The correct syntax is either Dictionary<String, String>() or [String: String]().
var words = Set<String>()

//This is a tuple
var name = (first: "Taylor", last: "Swift")
name.0
name.first

//This is a dictionary
var myDictionary = ["first": 1, "second": 2, "third": 3]
let value = myDictionary["forth",default:0]

//This is a dictionary with TYPE ANNOTATION:
var teams = [String: String]()
teams["Paul"] = "Red"





//ENUMERATIONS / Enums:
let result = "failure"
let result2 = "failed"
let result3 = "fail"
//such a situation equals:

enum Result {
    case success
    case failure
}
let result4 = Result.failure
//This stops you from accidentally using different strings each time.
//Well, at their simplest an enum is simply a nice name for a value. We can make an enum called Direction with cases for north, south, east, and west, and refer to those in our code. Sure, we could have used an integer instead, in which case we’d refer to 1, 2, 3, and 4, but could you really remember what 3 meant? And what if you typed 5 by mistake?

//So, enums are a way of us saying Direction.north to mean something specific and safe. If we had written Direction.thatWay and no such case existed, Swift would simply refuse to build our code – it doesn’t understand the enum case. Behind the scenes, Swift can store its enum values very simply, so they are much faster to create and store than something like a string.

enum Activity {
    case bored
    case running
    case talking
    case singing
}

enum Activity2 {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}
// with :Int, they automatic assigns "raw value" to elements(starting from 0)

enum Planet2: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
// with = 1, it is now starting from 1.




