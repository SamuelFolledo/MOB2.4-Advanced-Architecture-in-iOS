//: [Previous](@previous)

import UIKit
import Combine

let sampleNotification = Notification.Name("sampleNotification")
let publisher = NotificationCenter.default
    .publisher(for: sampleNotification, object: nil)

let center = NotificationCenter.default

// 1 - Creating the subscription using sink
let subscription = publisher
    .sink { _ in
        print("Notification received using a publisher 📣")
    }

// 2 - Posting notification
center.post(name: sampleNotification, object: nil)

// 3 - Cancel subscription
subscription.cancel()


//: [Next](@next)
