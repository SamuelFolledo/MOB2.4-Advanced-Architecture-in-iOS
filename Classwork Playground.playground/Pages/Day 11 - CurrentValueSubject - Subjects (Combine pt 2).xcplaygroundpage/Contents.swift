//: [Previous](@previous)

import Foundation
import Combine

// 1- Creating a set
var subscriptions = Set<AnyCancellable>()

// 2 - This will publish integers, never an error, initial value is 0
let subject = CurrentValueSubject<Int, Never>(0)

// 3 - Creating a subscription to print received values
subject
    .print()
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions) // 4 - Store it in the set

subject.send(1)
subject.send(2)

//: [Next](@next)
