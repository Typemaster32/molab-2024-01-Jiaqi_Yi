//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

struct Car {
    let model: String
    let numberOfSeats: Int
    var currentGear: Int
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        if currentGear <= 0{self.currentGear=1}else if currentGear > 10 {self.currentGear=10}else{self.currentGear=currentGear}
    }
    mutating func gearUp(){
        if self.currentGear < 10{
            self.currentGear += 1}
    }
    mutating func gearDown(){
        if self.currentGear > 1{
            self.currentGear -= 1}
    }
}
var benz = Car(model: "Mercedez", numberOfSeats: 5, currentGear: 6)
benz.gearUp()
print(benz.currentGear)
