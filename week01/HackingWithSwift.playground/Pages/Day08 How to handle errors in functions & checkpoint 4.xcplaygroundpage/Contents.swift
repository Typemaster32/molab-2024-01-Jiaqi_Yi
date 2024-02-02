//: [Previous](@previous)

import Foundation

//var greeting = "Hello, playground"

//: [Next](@next)
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
print(characters.count)
//When we call removeAll(), Swift will automatically remove all the items in the array, then free up all the memory that was assigned to the array. That’s usually what you’ll want, because after all you’re removing the objects for a reason. But sometimes – just sometimes – you might be about to add lots of new items back into the array, and so there’s a second form of this function that removes the items while also keeping the previous capacity:
characters.removeAll(keepingCapacity: true)
//What happens here?


//Watch this: this is valid Swift. "_" is ok here.
func parkCar(_ type: String, automatically: Bool = true) {
    if automatically {
        print("Nice - my \(type) parked itself!")
    } else {
        print("I guess I'll have to do it.")
    }
}
parkCar("Tesla")

//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//That says there are two possible errors with password: short and obvious. It doesn’t define what those mean, only that they exist.


enum PasswordError: Error {
    case short, obvious
}
//STEP1: define the errors here using enum


func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}



let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}
//The reason Swift is different is fairly simple: by forcing us to use try before every throwing function, we’re explicitly acknowledging which parts of our code can cause errors.


enum rootErrors: Error{
    case outOfField
    case noRoot
}

func manualRoot(_ target: Int)throws -> Int{
    var root: Int = 0
    if target > 10000 || target < 1 {
        throw rootErrors.outOfField
    } else {
        for testRoot in 1...100{
            if testRoot * testRoot == target {
                root = testRoot
            } else if testRoot * testRoot < target && (testRoot+1) * (testRoot+1) > target {
                throw rootErrors.noRoot
            }
        }
    }
    return root
}

manualRoot(9)
