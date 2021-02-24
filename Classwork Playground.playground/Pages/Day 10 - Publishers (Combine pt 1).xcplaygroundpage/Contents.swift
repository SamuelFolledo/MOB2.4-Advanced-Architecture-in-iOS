//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// 1 - Create a notification name

let sampleNotification = Notification.Name("sampleNotification")

// 2 - Accessing the NotificationCenter's default center and calling the publisher
let publisher = NotificationCenter.default
    .publisher(for: sampleNotification, object: nil)


//Traditional way of posting

let center = NotificationCenter.default

// 3 - An observer to listen to nottifications
let observer = center.addObserver(
    forName: sampleNotification,
    object: nil,
    queue: nil) { notification in
    print("Notification received ✔️")
}

// 4 - Posting a notification
center.post(name: sampleNotification, object: nil)

// 5 - Removing observer
center.removeObserver(observer)


//: [Next](@next)
