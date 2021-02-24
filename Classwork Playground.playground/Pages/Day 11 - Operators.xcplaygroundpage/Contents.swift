//: [Previous](@previous)

import UIKit
import Combine


//: ## Transforming Operators

//MARK: - Collect
print("Collect")
["🐊", "🦖", "🦕", "🐢", "🐍"].publisher
    .collect() //variation: specifying receiving up to a number of values
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })

//MARK: - Map
print("\nMap")
let formatter = NumberFormatter()
formatter.numberStyle = .spellOut
[8, 16, 20].publisher
    .map {
        formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
    }
    .sink(receiveValue: { print($0) })

print("")

print("")

//: ## Filtering Operators

//MARK: - Filter
print("Filter")
let numbers = (1...100).publisher
numbers
    .filter { $0.isMultiple(of: 5) }
    .sink(receiveValue: { n in
        print("\(n) is a multiple of 5")
    })


//MARK: - CompactMap
print("\nCompactMap")
let strings = ["hey", "meh", "8","0.88", "80"].publisher
strings
    .compactMap { Int($0) }
    .sink(receiveValue: {
        print($0)
    })


//: ## Combining Operators

//MARK: - Append
print("\nAppend")
let appendPublisherA = ["1️⃣", "2️⃣", "3️⃣"].publisher
let appendPublisherB = ["4️⃣", "5️⃣", "6️⃣"].publisher

appendPublisherA
    .append(appendPublisherB)
    .sink(receiveValue: { print($0) })

print("")


//MARK: - CombineLatest
print("\nCombineLatest")
let publisherA = PassthroughSubject<String, Never>()
let publisherB = PassthroughSubject<String, Never>()

publisherA
    .combineLatest(publisherB)
    .sink(receiveCompletion: { _ in print("Completed") },
          receiveValue: { print("\($0),\($1)") })

publisherA.send("🐞")
publisherA.send("🦋")
publisherB.send("🕷")
publisherB.send("🕸")
publisherA.send("🐛")
publisherA.send(completion: .finished)
publisherB.send(completion: .finished)
print("")


//: ## Sequence Operators
//MARK: - Min
print("\nMin")
let sequencePublisher = [100, 80, -2, 0].publisher

sequencePublisher
    .min()
    .sink(receiveValue: { print("Smallest value: \($0)") })

print("")


//MARK: - Count
print("\nCount")
let countPublisher = ["🐣", "🐣", "🐣"].publisher

countPublisher
    .count()
    .sink(receiveValue: { print("I have \($0) chickens") })

print("")


//MARK: - Contains
print("\nContains")
struct Movie {
    let year: Int
    let title: String
}

let movies = [
    (2001, "Harry Potter and the Philosopher's Stone"),
    (2002, "Harry Potter and the Chamber of Secrets"),
    (2004, "Harry Potter and the Prisoner of Azkaban"),
    (2005, "Harry Potter and the Goblet of Fire"),
    (2007, "Harry Potter and the Order of the Phoenix"),
    (2009, "Harry Potter and the Half-Blood Prince"),
    (2010, "Harry Potter and the Deathly Hallows – Part 1"),
    (2011, "Harry Potter and the Deathly Hallows – Part 2"),
]
.map(Movie.init)
.publisher

movies
    .contains(where: { $0.year == 2005 })
    .sink(receiveValue: { contains in
        print(contains ? "A HP movie was released" : "No HP movie was released that year.")
    })

print("")

//: ## Timer

let start = Date()

var subscriptions = Set<AnyCancellable>()

Timer.publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
    .map({ (output) in
        return output.timeIntervalSince(start)
    })
    .map({ (timeInterval) in
        return Int(timeInterval)
    })
    .sink { (seconds) in
        print("Seconds: \(seconds)")
    }
    .store(in: &subscriptions)


//: [Next](@next)
