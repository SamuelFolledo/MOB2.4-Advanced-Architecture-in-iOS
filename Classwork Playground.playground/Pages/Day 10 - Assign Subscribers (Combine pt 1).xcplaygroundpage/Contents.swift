//: [Previous](@previous)

import Foundation
import Combine

// 1 - Defining a class with a property that has a didSet property observer
class Student {
    var message: String = "" {
        didSet {
            print(message)
        }
    }
}

// 2 - Creating an instance of the class
let student = Student()

// 3 - Ceating a publisher from an array of strings
let publisher = ["Hello", "Ok bye."].publisher

// 4 - Subscribing to the publisher, assigning each value received to the name property
// the syntax \. is the way to specify the key path
let subscription = publisher
    .assign(to: \.message, on: student)

//: [Next](@next)
