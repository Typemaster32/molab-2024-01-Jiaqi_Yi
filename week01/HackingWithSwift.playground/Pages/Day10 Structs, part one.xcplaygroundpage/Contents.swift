//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
    // func takeVacation function cannot change the value of the instance of the struct.
    // if need change, add a "mutating" before "func"
}
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)


var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
//syntactic sugar: "init()" is saved here.

let a = 1
let b = 2.0
let c = Double(a) + b
//Double() here is also an example.

struct Employee2 {
    let name: String
    var vacationRemaining = 14
}
//here vacationRemaining is by default 14, unless other way instructed

var archer3 = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer3.vacationRemaining -= 5
//this is how to change parameter

struct Employee4 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
    //    1. vacationRemaining is type-annotated as Int;
    //    2. vacationRemaining equals the return in the braces;
    //    3. because there's only one line, so it saved "return"
    
    var vacationRemaining2: Int {
        get {
            vacationAllocated - vacationTaken
        }
        //        1. vacationRemaining2 is also an Int;
        //        2. it equals what's in the "get" braces;
        set {
            vacationAllocated = vacationTaken + newValue
            //newValue is the default name and can be changed.
            //if changing, it should be:
            //            set(newVacationRemaining) {
            //            vacationAllocated = vacationTaken + newVacationRemaining
            //        }
        }
    }
}
var archer4 = Employee4(name: "Sterling Archer", vacationAllocated: 14)
archer4.vacationTaken += 4
archer4.vacationRemaining2 = 5
//1. the trigger condition of "set" is trying to give a value to it;
//2. the value I wanna give is going to be taken as "newValue";
//3. "newValue" is a placeholder;
//4.  placeholder can be named almost freely;
//5.  when I tried to give a value to "vacationRemaining2", I am actually changing other parameters because vacationRemaining2 is live-updated due to the getter part
//Trigger Condition of "Set": Exactly, the set block is triggered when you attempt to assign a new value to the computed property. This assignment initiates the execution of the code within the set block.
//Value as "newValue": Correct. Within the set block, newValue represents the value that is being assigned to the computed property. It's the default name for this value in Swift, but you can customize it if you want.
//"newValue" Is a Placeholder: Yes, newValue acts as a placeholder within the set block for the value being assigned to the property.
//Placeholder Can Be Named Almost Freely: You can indeed rename newValue to almost anything you like for clarity or to better fit the context of your code.
print(archer4.vacationAllocated)
// 9 = 4 + 5
// If the logic within the setter (set) of a computed property is not carefully considered, it can lead to unexpected behavior or inconsistencies in your program's state.


struct Code {
    var language: String
    var containsErrors = false

    var report: String { 
        // This explicitly states the return type;
        // Constants cannot be computed properties.


        if containsErrors {
            return "This \(language) code has bugs!"
        } else {
            return "This looks good to me."
        }
    }
}
// this is the version that didn't save "return"



//How to take action when a property changes? didSet() / willSet()

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
//didSet() runs everytime when score is set with value.

var game = Game()
game.score += 10
//print("Score is now \(game.score)")
game.score -= 3
//print("Score is now \(game.score)")
game.score += 1


struct BankAccount {
    var name: String
    var isMillionnaire = false
    var balance: Int {
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
            } else {
                isMillionnaire = false
            }
        }
    }
}

var testBank=BankAccount(name:"aoc",balance:500)
testBank.balance=5


//How to create custom initializers
//The initializer is called when you create an instance of that struct.


struct Player {
    let name: String
    let number: Int
    
    init(name: String, number: Int) {
            self.name = name
            self.number = number
        }
    //this is the saved: initializer;
    //no func;
    //no return;
}

let player = Player(name: "Megan R", number: 15)
//without having init() in the struct, swift would use "memberwise initializer"

struct Player2 {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name//Its use is mandatory when an initializer parameter name is the same as the property name to distinguish between the parameter and the property.
        number = Int.random(in: 1...99)//here "self." is saved.
    }
}

let player2 = Player2(name: "Megan R")
print(player2.number)
//EVERY PARAMETER SHOULD BE ASSIGNED WITH A VALUE AT THE END OF THE INITIALIZER.


struct Dictionary {
    var words = Set<String>()
}
let dictionary = Dictionary()
//"words" is initialized as an empty Set of String elements.
