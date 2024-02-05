//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

protocol building{
    var floors:Int { get }
    var costTotal:Int { get }
}


protocol Politician {
    var isDirty: Bool { get set }
    func takeBribe()//this is a blank func
}




extension Politician {
    func takeBribe() {
        if isDirty {
            print("Thank you very much!")
        } else {
            print("Someone call the police!")
        }
    }
}
//this is valid swift, implementing a detailed function in swift(not ok to create, but ok to implement)

struct Mayor: Politician {
    var isDirty: Bool
}
//this struct doe not have the function

var someMayor = Mayor(isDirty: true)
someMayor.takeBribe() // Prints "Thank you very much!"

someMayor.isDirty = false
someMayor.takeBribe() // Prints "Someone call the police!"
//but is ok to print


protocol SuperHeroMovie {
    func writeScript() -> String
}
extension SuperHeroMovie {
    func makeScript() -> String {
        return """
        Lots of special effects,
        some half-baked jokes,
        and a hint of another
        sequel at the end.
        """
    }
}
//this is NOT wrong, (you CAN add a new function as extensions)
