//: [Previous](@previous)

import Combine

let numbers = (1...100).publisher
numbers.filter { $0 > 80 }
    .filter { $0.isMultiple(of: 2) }
    .sink {
        print($0)
    }

//: [Next](@next)
