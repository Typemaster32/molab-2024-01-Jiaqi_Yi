//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


//How to limit access to internal data using access control?

struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

//Use private for “don’t let anything outside the struct use this.”
//Use fileprivate for “don’t let anything outside the current file use this.”
//Use public for “let anyone, anywhere use this.”
//When you apply private(set) to a property of a struct or class, you are effectively making the setter private while keeping the getter public.

struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: [String]) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: ["Mrs Hughes"])

//For an empty array of integers: var numbers = [Int]()
//For an empty set of strings: var stringSet = Set<String>()
//For an empty dictionary with string keys and integer values: var dictionary = [String: Int]()

struct School2 {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
School2.add(student: "Taylor Swift")
print(School2.studentCount)
//static:
//1. only exists in the STRUCT, not exists in instances
//2. changable, overwhelms "mutating"
//3. To access non-static code from static code… you’re out of luck: static properties and methods can’t refer to non-static properties and methods because it just doesn’t make sense – which instance of School would you be referring to?
//4. Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
//here the advantage of using static to create an example:
    //1. Always having an available example to use;
    //2. Skips the initializer;
    //3. Always stay the same.
//Example of this: Imagine a player named Alex who has just downloaded the game. Alex sees the "Quick Start" option on the main menu and decides to use it to dive right into the game without creating a new character. The game loads Character.defaultCharacter, and Alex is immediately placed in the game world as the "Novice Hero," a Warrior with balanced stats. This seamless entry allows Alex to start enjoying the game right away, learning the basics of gameplay without the initial complexity of character customization.

struct Cat {
    static var allCats = [Cat]()
    init() {
        Cat.allCats.append(self)
    }
    static func chorus() {
        for _ in allCats {
            print("Meow!")
        }
    }
}
