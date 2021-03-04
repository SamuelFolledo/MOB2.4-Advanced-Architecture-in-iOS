//: [Previous](@previous)

import Combine

/*:
 ## [Filtering Operators](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/#/Lessons/Combine-Pt.2/README?id=filtering-operators)
 */

///Filter
let numbers = (1...100).publisher
numbers.filter { $0 > 80 }
    .filter { $0.isMultiple(of: 2) }
    .sink {
        print($0)
    }

print()

///CompactMap
let strings = ["hey", "meh", "8","0.88", "80"].publisher

strings
    .compactMap { Int($0) }
    .sink(receiveValue: {
        print($0)
    })

//: [Next](@next)
