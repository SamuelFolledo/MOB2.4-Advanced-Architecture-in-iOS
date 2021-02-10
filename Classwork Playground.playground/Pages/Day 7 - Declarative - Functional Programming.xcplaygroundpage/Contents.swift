//: [Previous](@previous)

import Foundation

/*:
 # [Imperative vs. Declarative Activity](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/09-Functional-ProgrammingPt.1/assignments/activity.md)
 */

//: [Next](@next)

/*:
 ## 1. Declarative
 Here is an imperative version of a function called doubleIt that takes an array of numbers and returns a new array after doubling every item in the initial array:
 ```
 func doubleIt(inputArray: Array[Int]) {

     var results = [Int]()

     for num in inputArray {
         results.append(num * 2)
     }
     print(results)
 }

 doubleIt(inputArray: [1,2,3]) // [2,4,6]
 ```
 ### TODO:
 Code the declarative (FP) version of doubleItso that it achieves the same result as the code above by using the map function instead of the for loop
 */

func doubleBetter<T>(numbers: [T]) -> [T] {
    var output = [T]()
    for num in numbers {
        if let number = num as? Int {
            output.append(number * 2 as! T)
        } else if let number = num as? Double {
            output.append(number * 2 as! T)
        } else {
            print("ERROR: '\(num)' data type is not supported")
        }
    }
    return output
}

let numbersArr = [1,2,3,4]
print(doubleBetter(numbers: numbersArr))

let stringsArr = ["Kobe", "MJ", "Rose"]
print(doubleBetter(numbers: stringsArr))

/*:
 ## 2. HOF - Filter
 Suppose we have an array containing strings representing the contents of a directory:
 
 ```let exampleFiles = ["README.md", "HelloWorld.swift", "FlappyBird.swift"]```

 Now suppose we want an array of all the .swift files. This is easy to compute with a simple loop. Use the HOF filter.
 */
let exampleFiles = ["README.md", "HelloWorld.swift", "FlappyBird.swift"]

let swiftFiles = exampleFiles.filter { $0.contains(".swift") }
print("Swift files \(swiftFiles)")
/*:
 ## 3. HOF - Reduce
 Define a function that sums all the integers in an array.
 */
print("Sum=", numbersArr.reduce(0) { return $0 + $1 })

/*:
 ## 4. HOF - Map
 Suppose we have the following struct, consisting of a city’s name and population (measured in thousands of inhabitants):
 We can define several example cities:

 ```let cities = [paris, madrid, amsterdam, berlin]```
 
 Print a list of cities with **at least one million inhabitants, together with their total populations**.
 */

struct City {
    let name: String
    let population: Int
}

extension City {
    func scalingPopulation() -> City {
        return City(name: name, population: population * 1000)
    }
}

let paris = City(name: "Paris", population: 1001).scalingPopulation()
let madrid = City(name: "Madrid", population: 999).scalingPopulation()
let amsterdam = City(name: "Amsterdam", population: 10000).scalingPopulation()
let berlin = City(name: "Berlin", population: 2).scalingPopulation()

let cities = [paris, madrid, amsterdam, berlin]

var populatedCities = [City]()
cities
    .filter({ $0.population > 1_000_000})
    .forEach {
        print("City \($0.name) has \($0.population) people")
        populatedCities.append($0)
    }


print(populatedCities)
