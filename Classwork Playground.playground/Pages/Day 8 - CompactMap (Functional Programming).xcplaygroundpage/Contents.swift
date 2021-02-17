//: [Previous](@previous)

import Foundation

//: # CompactMap
/*:
For collections (Arrays, Strings, or Dictionaries) we can use
`compactMap`. With `compactMap`, instead of flattening nested
collection, you can flatten optionals inside a collection.
 
This means you can filter nils out. Here's an example:
*/
let numbers = ["5", "42", "nine", "100", "😆"]
let result = numbers.compactMap({ Int($0) })

print(result) // [5, 42, 100]

//: #### Exercise 1
/*:
Create a function that removes all vowels from a string. Use compactMap
*/

let vowels: [Character] = ["a", "e", "i", "o", "u"]

let myName = "Samuel"
let filteredName = myName.compactMap { vowels.contains($0) ? nil : String($0) }.joined()
print(filteredName)

func removeVowels(word: String) -> String {
    word.compactMap { vowels.contains($0) ? nil : String($0) }.joined()
}
print(removeVowels(word: "Kobe"))

func removeVowels2(word: String) -> String {
    String(word.compactMap { char -> Character? in
        switch char {
        case "a", "e", "i", "o", "u": return nil
        default: return char
        }
    })
}
print(removeVowels2(word: "Kobe"))

//: #### Exercise 2
/*:
Generate values from 0 to 100, with only even numbers. And
also skip every factor of ten.
Expected result:
 
`[2, 4, 6, 8, 12, 14, 16, 18, 22, 24, 26, 28]`
*/

let sequence = stride(from: 0, to: 100, by: 2).compactMap{ int in
    return int % 10 == 0 ? nil : int
}
print(sequence)

//: [Next](@next)
