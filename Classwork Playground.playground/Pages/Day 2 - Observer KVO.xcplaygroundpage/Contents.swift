//: [Previous](@previous)

import Foundation

/*:
 # [Observer Pattern: KVO Activity](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/04-Behavioral-PatternsPt.2/assignments/kvo.md)
 
 TODO: Complete and run the partially-implemented playground code below following the steps from Apple's Using Key-Value Observing in Swift document listed above.

 ### Implementation Notes:
 Your Subject class only needs to have:
 1. A variable called counter, initialized to 0, and modified with
 
    `@objc dynamic`
 2. Your Observer class needs this specific init() function:
 3. Observer and Subject **must be a `class`**
 4. No need to remove observers as if the reference is removed, the **observer is automatically removed in KVO**.
 */

import Foundation

/* Step 1: Create a Subject class and Annotate a Property for Key-Value Observing */

//TODO: Create Subject class...
class ProductSubject: NSObject {
    @objc dynamic var counter = 0
}

class NameSubject: NSObject {
    @objc dynamic var name = "Samuel"
}

/* Step 2: Define an Observer class */
class Observer: NSObject {

    @objc var subject: ProductSubject
    @objc var name: NameSubject
    
    //TODO: Add init()
    init(subject: ProductSubject, name: NameSubject) {
        self.subject = subject
        self.name = name
        super.init()
        subject.addObserver(self, forKeyPath: "counter",
                                    options: NSKeyValueObservingOptions.new, context: nil)
        name.addObserver(self, forKeyPath: "name",
                                    options: NSKeyValueObservingOptions.new, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("Notification: \(String(describing: keyPath)) = \(String(describing: change?[NSKeyValueChangeKey.newKey]!))");
    }
}
/* Step 3: Associate the Observer with the Property to Observe */
let subject = ProductSubject()
let name = NameSubject()
let observer = Observer(subject: subject, name: name)

/* Step 4: Respond to a Property Change */
subject.counter += 11
subject.counter = 99

name.name = "Kobe"
print()
let newObserver = observer
print()
print(newObserver.name.name)
observer.name.name = "MJ"
print()
print(newObserver.name.name)
print()
print()
newObserver.name.name = "Kobe again"
print("obs = ", observer.name.name)

/* RESULTS - Should print:
Notification: Optional("counter") = Optional(11)
Notification: Optional("counter") = Optional(99)
*/

//: [Next](@next)
