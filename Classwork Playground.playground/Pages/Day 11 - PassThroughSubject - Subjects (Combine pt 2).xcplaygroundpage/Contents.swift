//: [Previous](@previous)

import Foundation
import Combine

// 1 - Custom error type
enum MyError: Error {
    case test
}

// 2 - Custom subscriber that receives strings and custom errror
class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MyError
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received:", input)
        // 3 - adjusting demands
        return input == "Faster" ? .max(1) : .none
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Received completion", completion)
    }
}

// 3 - Instance of the subscriber
let subscriber = StringSubscriber()
// 4 - instance of passthroughsubject with defined types
let subject = PassthroughSubject<String, MyError>()

// 5 - subscribing
let subscriptionA = subject.subscribe(subscriber)

// 6 - another subscription with sink
/*let subscriptionB = subject
    .sink(
        receiveCompletion: { completion in
            print("Received completion with sink:", completion)
        },
        receiveValue: { value in
            print("Received with sink:", value)
        }
    )
*/


subject.send("Better ")
subject.send("Faster")

// 7 - cancel second subscription
//subscriptionB.cancel()

// 8 - send another value
subject.send("Stronger")

//subject.send(completion: .failure(MyError.test))
//subject.send(completion: .finished)
subject.send("🎵")

//: [Next](@next)
