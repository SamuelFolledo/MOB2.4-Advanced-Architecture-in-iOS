//: [Previous](@previous)

/*:
 # [Singleton Pattern Activity](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/01-Creational-PatternsPt.1/assignments/singleton.md)
 */

import UIKit

class DataSourcePatterns {
    
    static let sharedInstance = DataSourcePatterns()

    var creationalPatternsArray = ["Abstract Factory", "Factory Method", "Builder", "Dependency Injection", "Lazy Initialization", "Object Pool", "Prototype", "Singleton"]
    
    private init() {
        print("self is:", self)
        print("creationalPatternsArray is", creationalPatternsArray)
    }

}

print(DataSourcePatterns.sharedInstance, "\n")

func looper(){

    for pattern in DataSourcePatterns.sharedInstance.creationalPatternsArray {
          print("Pattern = \(pattern)")
    }
}
looper()

/*:
 ## As A Class

 Q: What is surprising or noteworthy about the result of running looper()?

 Q: What use cases can you imagine for the Singleton pattern?

 ## Stretch Challenge
 Create a networking class that will serve as a shared resource in an app. You can read [this article](https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift) to find some inspiration.
 */

//: [Next](@next)
