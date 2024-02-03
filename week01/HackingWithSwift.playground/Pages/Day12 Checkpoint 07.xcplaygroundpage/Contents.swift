//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

class Animal {
    var legs:Int
    init(legs:Int){
        self.legs=legs
    }
}

class Dog: Animal{
    let legs=4
    var barking:String
    init(barking: String) {
        self.barking = barking
    }
    func bark() {
        print(barking)
    }
}

class Corgi: Dog{
    let barking="Hi! I'm a Corgi!"
}

class Poodle: Dog{
    let barking="Hi! I'm a Poodle!"
}

class Cat:Animal{
    let legs=4
    var isTame:Bool
    init(isTame: Bool) {
        self.isTame = isTame
    }
}
