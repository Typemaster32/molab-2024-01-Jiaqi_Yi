//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//1. Protocols

protocol Vehicle {
    var name:String{get set}
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    var name:String
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
    //new added
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}
//Here what's used in the func commute is estimateTime and travel, which are all in Vehicle.
//so it can be "func commute(distance: Int, using vehicle: Vehicle) {" or "func commute(distance: Int, using vehicle: Car) {"

let car = Car(name: "dww")
commute(distance: 100, using: car)


protocol Vehicle2 {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}
//getTravelEstimates(using: [car, bike], distance: 150)


//when should you write getter only:
protocol Document {
    var wordCount: Int { get }
}

struct Essay: Document {
    var content: String
    var wordCount: Int {
        content.split(separator: " ").count
    }
}

struct Book: Document {
    var chapters: [String]
    var wordCount: Int {
        chapters.reduce(0) { $0 + $1.split(separator: " ").count }
    }
}
//set-only: do not exist
    
extension String {
    var isLong: Bool {
        count > 25
    }
}
//this is valid!
