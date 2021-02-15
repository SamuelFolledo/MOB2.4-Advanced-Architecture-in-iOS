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


//: #### Exercise 2
/*:
Generate values from 0 to 100, with only even numbers. And
also skip every factor of ten.
Expected result:
 
`[2, 4, 6, 8, 12, 14, 16, 18, 22, 24, 26, 28]`
*/



//: [Next](@next)
