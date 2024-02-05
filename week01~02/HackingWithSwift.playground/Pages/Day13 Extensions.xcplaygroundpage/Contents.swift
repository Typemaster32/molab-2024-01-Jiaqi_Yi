//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)//built-in
print(trimmed)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
print(quote.trimmed())
//this is the same

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}
//this is also the same
print(trim(quote))

extension String {
    mutating func trim() {
        print(self.trimmed())//this prints the right way
        self = self.trimmed()
//        return self
    }
}
//this is also, the same!

print(quote)//this prints original one
print(quote.trim())//this prints "()", because .trim() does not return anything. if add "->String" and "return self", it would work.
print(quote)//this prints correctly
extension Int {
    func squared() -> Int {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())//this prints correctly because there's a "->Int"
// if you’re returning a new value rather than changing it in place, you should use word endings like ed or ing, like reversed().



//Extensions of Protocols:
let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}
if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

protocol Person {
    var name: String { get }
//    func sayHello()
}


extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

]
let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()
