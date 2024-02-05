//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//First, the things that classes and structs have in common include:
//
//You get to create and name them.
//You can add properties and methods, including property observers and access control.
//You can create custom initializers to configure new instances however you want.
//However, classes differ from structs in five key places:
//
//You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
//Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
//When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
//When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
//Even if you make a class constant, you can still change its properties as long as they are variables.

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
//the only difference between that and a struct is that it was created using class rather than struct

class Empty { }
let nothing = Empty()


//this is how to make a child-class
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
    //"override func":change the func that is inherited from parent-class
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

//1. how is it possible to call init() inside init()?
//2. is init() also inherited when creating child classes?
//3. is the code right here creating a new init(), rather than inherit from parent class?

//The code snippet you provided is an example of class inheritance and initializer delegation in Swift, where a `Car` class inherits from a `Vehicle` class. Let's address your questions one by one:
//
//### 1. How is it possible to call `init()` inside `init()`?
//
//In Swift, classes can call other initializers from within an initializer. This is known as initializer delegation. There are two types of initializer delegation:
//
//- **Calling a designated initializer from another designated initializer in the same class**: This is not allowed in Swift. A designated initializer must call a designated initializer from its immediate superclass.
//- **Calling a superclass initializer**: Subclasses must call a designated initializer from their immediate superclass to ensure that all properties introduced by the superclass are properly initialized. This is done using `super.init(...)`. In your example, `super.init(isElectric: isElectric)` is called from the `Car` class's initializer to ensure the `Vehicle` class's `isElectric` property is initialized.
//
//### 2. Is `init()` also inherited when creating child classes?
//
//In Swift, a subclass inherits the superclass's initializers only under certain conditions:
//- If the subclass provides default values for all new properties it introduces and does not define any designated initializers, it automatically inherits all of its superclass designated initializers.
//- If the subclass provides an implementation of all of its superclass designated initializers (either by inheriting them as described above or by providing a custom implementation), it also inherits all of the superclass convenience initializers.
//
//In your code, `Car` defines its own designated initializer and does not automatically inherit the `init(isElectric: Bool)` initializer from `Vehicle` because it needs to ensure that both `isElectric` and its own `isConvertible` properties are initialized.
//
//### 3. Is the code right here creating a new `init()`, rather than inherit from the parent class?
//
//Yes, the code defines a new designated initializer for the `Car` class that takes two parameters: `isElectric` and `isConvertible`. This is necessary because `Car` introduces a new property (`isConvertible`) that must be initialized alongside the inherited `isElectric` property. The `Car` class's initializer first initializes its own properties before calling `super.init(isElectric: isElectric)` to delegate up to the `Vehicle` class's initializer, ensuring all properties are correctly initialized according to the initialization rules of Swift.
//
//In summary:
//- It's a requirement to call the superclass's initializer from a subclass's initializer to ensure all inherited properties are properly initialized.
//- Initializers are not automatically inherited if the subclass defines its own designated initializers, which is what's happening in your example.
//- The `Car` class is correctly defining a new initializer to handle its own properties as well as those inherited from `Vehicle`.




//How to copy classes?

class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
    //this is a "deep-copy"
}
var user1 = User()
var user2 = user1 //this is the copy procedure
user2.username = "Taylor"

print(user1.username)
print(user2.username)

//If you want to create a unique copy of a class instance – sometimes called a deep copy – you need to handle creating a new instance and copy across all your data safely.


//deintializer:
//Just like initializers, you don’t use func with deinitializers – they are special.
//Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
//Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
//We never call deinitializers directly; they are handled automatically by the system.
//Structs don’t have deinitializers, because you can’t copy them.


class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User2(id: i) //here it creates and ends the instance of class User2
    print("User \(user.id): I'm in control!")
}

var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

class User3 {
    var name = "Paul"
}

let user4 = User3()
user4.name = "Taylor"
print(user4.name) //it's Taylor

//Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
//Constant instance, variable property – a signpost that always points to the same user, but their name can change.
//Variable instance, constant property – a signpost that can point to different users, but their names never change.
//Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.


class IceCream {
    deinit {
        print("No more icecream :(")
    }
}
