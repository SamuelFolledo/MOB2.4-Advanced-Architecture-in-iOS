//: [Previous](@previous)

import Foundation
import Combine

//Helper Code
public let cards = [
    ("🂡", 11), ("🂢", 2), ("🂣", 3), ("🂤", 4), ("🂥", 5), ("🂦", 6), ("🂧", 7), ("🂨", 8), ("🂩", 9), ("🂪", 10), ("🂫", 10), ("🂭", 10), ("🂮", 10),
    ("🂱", 11), ("🂲", 2), ("🂳", 3), ("🂴", 4), ("🂵", 5), ("🂶", 6), ("🂷", 7), ("🂸", 8), ("🂹", 9), ("🂺", 10), ("🂻", 10), ("🂽", 10), ("🂾", 10),
    ("🃁", 11), ("🃂", 2), ("🃃", 3), ("🃄", 4), ("🃅", 5), ("🃆", 6), ("🃇", 7), ("🃈", 8), ("🃉", 9), ("🃊", 10), ("🃋", 10), ("🃍", 10), ("🃎", 10),
    ("🃑", 11), ("🃒", 2), ("🃓", 3), ("🃔", 4), ("🃕", 5), ("🃖", 6), ("🃗", 7), ("🃘", 8), ("🃙", 9), ("🃚", 10), ("🃛", 10), ("🃝", 10), ("🃞", 10)
]

public typealias Card = (String, Int)
public typealias Hand = [Card]

public extension Hand {
    var cardString: String {
        map { $0.0 }.joined()
    }
    
    ///sum of all cards
    var points: Int {
        map { $0.1 }.reduce(0, +)
    }
}

public enum HandError: Error, CustomStringConvertible {
    case busted
    
    public var description: String {
        switch self {
        case .busted:
            return "Busted!"
        }
    }
}

// Challenge starts here

let dealtHand = PassthroughSubject<Hand, HandError>()

func deal(_ cardCount: UInt) {
    var deck = cards
    var cardsRemaining = 52
    var hand = Hand()
    
    for _ in 0 ..< cardCount {
        let randomIndex = Int.random(in: 0 ..< cardsRemaining)
        hand.append(deck[randomIndex])
        deck.remove(at: randomIndex)
        cardsRemaining -= 1
    }
    
    // Add code to update dealtHand here:
    // If the hand's points property is greater than 21, send the `HanError.busted` error through the `dealtHand` subject.
    // Else, send the `hand` value
    if hand.points > 21 {
        dealtHand.send(completion: Subscribers.Completion<HandError>.failure(.busted))
    } else {
        print("Gucci \(hand.points)")
        dealtHand.send(hand)
    }
}

/*
 Add a subscription to dealtHand that handles receiving both: values and an error.
 
 For received values: print a string containing the results of the hand’s cardString and points properties.
 For an error, print it out. You can receive either a .finished or a .failure in the receivedCompletion block, distinguish whether that completion is a failure or not.
 */

let subscriptionB = dealtHand
    .sink(
        receiveCompletion: { completion in
            print("Received completion with sink:", completion)
        },
        receiveValue: { dealtHand in
            print("Received with sink:", dealtHand.cardString)
        }
    )

deal(3)

//: [Next](@next)
