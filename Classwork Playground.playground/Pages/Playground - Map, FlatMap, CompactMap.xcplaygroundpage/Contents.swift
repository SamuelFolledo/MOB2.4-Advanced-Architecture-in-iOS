//: [Previous](@previous)

import Foundation

///map - applies a function to every single value

//Ex. 1
let arrayOfIntegers = [1, 2, 3, 4]
let arrayOfStrings = arrayOfIntegers.map { String($0) }

print(arrayOfStrings) // Prints ["1", "2", "3", "4"]

//Ex. 2
let arrayOfIntegers2 = [1, 2, nil, 4]
let arrayOfStrings2 = arrayOfIntegers2.map { String(describing: $0) }

print(arrayOfStrings2) // Prints ["Optional(1)", "Optional(2)", "nil", "Optional(4)"]


/// compactMap - applies a function and filters out nil values
let arrayOfStrings3 = arrayOfIntegers2.compactMap { $0 }.map(String.init)
print(arrayOfStrings3) // Prints ["1", "2", "4"]

///flatMap - flattens by a level a collection
let arrayOfIntegers4 = [[1, 3, 5, nil], [2, nil, 6]]
let arrayOfStrings4 = arrayOfIntegers4.flatMap { $0 }.compactMap { $0 }

print(arrayOfStrings4) // Prints [1, 3, 5, 2, 6]
//: [Next](@next)
