//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}
//In fact, Xcode is really smart here: if you write for plat it will recognize that there’s an array called platforms, and offer to autocomplete all of for platform in platforms – it recognizes that platforms is plural and suggests the singular name for the loop variable. When you see Xcode’s suggestion appear, press Return to select it.

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}
//The 1...12 part is a range, and means “all integer numbers between 1 and 12, as well as 1 and 12 themselves.”

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}
//Counting from 1 through 5: 从1数到5
print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}
//Counting 1 up to 5： 从1数到4

let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for _ in names {
    print("[CENSORED] is a secret agent!")
}
// when don't need to use name, just need the number, use "_".

//CHECKPOINT 3

for n in 1...100{
    var text = ""
    if n % 3 == 0{
        text += "Fizz"
    }
    if n % 5 == 0{
        text += "Buzz"
    }
    if text == ""{print(n)}else {print(text)}
}
