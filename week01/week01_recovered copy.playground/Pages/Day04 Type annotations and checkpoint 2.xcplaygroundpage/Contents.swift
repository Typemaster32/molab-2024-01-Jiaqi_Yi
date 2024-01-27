//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//Due to my mistake, I was taking "100 Days of Swift" instead of "100 Days of SwiftUI", type annotations are included in day02 and day03;

var cities = ["Changsha","Nanjing","New York", "London", "Tokyo","New York"];
print("the number of cities are: "+String(describing:cities.count)+", and there are:")
var uniqueCities = Set(cities)
print(String(describing:uniqueCities.count)+" unique cities.\nThey are:")
for city in uniqueCities {
    print(city)
}
