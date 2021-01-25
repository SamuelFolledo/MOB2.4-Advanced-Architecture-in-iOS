//: [Previous](@previous)
//: # [Apple's Observer KVO Way](https://developer.apple.com/documentation/swift/cocoa_design_patterns/using_key-value_observing_in_swift)

import Foundation

/* Step 1: Create a Subject class and Annotate a Property for Key-Value Observing */

//TODO: Create Subject class...
class ProductSubject: NSObject {
    @objc dynamic var counter = 0
    var productName: String
    
    init(productName: String) {
        self.productName = productName
    }
}

/* Step 2: Define an Observer class */
class Observer: NSObject {

    var name: String
    @objc var productToObserve: ProductSubject
    var observation: NSKeyValueObservation?
    
    //TODO: Add init()
    init(name: String, productToObserve: ProductSubject) {
        self.name = name
        self.productToObserve = productToObserve
        super.init()
        
        observation = observe(
            \.productToObserve.counter,
            options: [.old, .new]
        ) { object, change in
            print("\(productToObserve.productName) inventories changed from: \(change.oldValue!), updated to: \(change.newValue!)")
        }
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("Notification: \(String(describing: keyPath)) = \(String(describing: change?[NSKeyValueChangeKey.newKey]!))");
    }
}
/* Step 3: Associate the Observer with the Property to Observe */
let subject = ProductSubject(productName: "iPhone 15")
let observer = Observer(name: "Samuel", productToObserve: subject)

/* Step 4: Respond to a Property Change */
subject.counter += 11
subject.counter = 99

/* RESULTS - Should print:
Notification: Optional("counter") = Optional(11)
Notification: Optional("counter") = Optional(99)
*/

//: [Next](@next)
