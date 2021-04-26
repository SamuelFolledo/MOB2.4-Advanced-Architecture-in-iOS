# [MOB2.4 - Advanced Architecture in iOS](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS)

Advanced iOS development course at [Make School](makeshcool.com) about architectural patterns that will help build rock solid iOS apps. This course covered architectural paradigms and dove deep into a cutting edge iOS patterns like Functional Programming & Functional Reactive Programming (FRP).

## Learning Outcomes
Students by the end of the course will be able to …

1. Analyze and apply different creational, behavioral and structural patterns.
2. Implement MVVM, Coordinators as architectural patterns.
3. Use functional programming in Swift.
4. Evaluate when to implement Reactive Programming in their projects.

## Important Notes/Classwork
- [Swift Patterns Cheat Sheet](https://docs.google.com/document/d/1I7dZ4qk_FJviZyDEKz7qTCIgQevZMV0zW1rz5cBLUMU/edit?usp=sharing)

## Schedule

### 1. Creational Patterns [part 1](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Lessons/01-Creational-PatternsPt.1) and [part 2](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Lessons/02-Creational-PatternsPt.2) *2021/01/20*

- [**Singleton Pattern** Playground](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Classwork%20Playground.playground/Pages/Day%201%20-%20Singleton%20Pattern.xcplaygroundpage/Contents.swift)
- [**Object Template Pattern** Playground](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Classwork%20Playground.playground/Pages/Day%201%20-%20Object%20Template%20Pattern.xcplaygroundpage/Contents.swift)
- [**Factory Method** Playground](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Classwork%20Playground.playground/Pages/Day%201%20-%20Factory%20Method.xcplaygroundpage/Contents.swift)
- [**Builder Pattern** Playground](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Classwork%20Playground.playground/Pages/Day%201%20-%20Builder%20Pattern.xcplaygroundpage/Contents.swift)

### 2. Behavioral Patterns [part 1](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Lessons/03-Behavioral-PatternsPt.1) and [part 2](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Lessons/04-Behavioral-PatternsPt.2) *2021/01/25*
- [****]()

### 3. Structural Patterns [part 1](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Lessons/05-Structural-PatternsPt.1) *2021/01/27*
- [Adapter Example](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/blob/master/Classwork%20Playground.playground/Pages/Day%203%20-%20Adapter%20Exampel.xcplaygroundpage/Contents.swift)
- [Adapter Activity playground](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/blob/master/Classwork%20Playground.playground/Pages/Day%203%20-%20Adapter%20Activity.xcplaygroundpage/Contents.swift)

### 4. Structural Patterns [part 2](https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/tree/master/Lessons/06-Structural-PatternsPt.2) *2021/02/01*
- [**Decorator**](https://docs.google.com/presentation/d/1LArfBIa9iJCyUi5vC50sHsW8Jo7jMu_BwKzgionwKhw/edit?usp=sharing)
- [**Proxy**](https://docs.google.com/presentation/d/1XWw2Bvakedp1rGoQBvvntXVQP5R5EyXc87YbwM3f4KM/edit?usp=sharing)
- [**Facade**](https://docs.google.com/presentation/d/1rcrC72QMSAVXnfkAhrWC_f2FbcWfK9yrmlszvmHsbuQ/edit?usp=sharing)

### 5. [MVVM]()

### 6. [Coordinators]()

### 7. [Functional Programming part 1]()

### 8. [Functional Programming part 2]()

### 9. Lab Day

### 10. [Combine part 1]()
- Publishers
- Subscribers
    - Built-in Subscribers //18:45m
        - [Assign](https://heckj.github.io/swiftui-notes/#reference-assign) - let’s us **bind** the result to some property in our model or on a UI control via a key path.
        - [Sink](https://heckj.github.io/swiftui-notes/#reference-sink) - let’s us pass closures and completion handlers (you can do anything here 😎)
    - A subscriber activates the publisher. Note that publishers won’t emit values if there are no subscribers.
- Operators
    - An object that acts both like a subscriber and a publisher
    - Classes that adopt both the Subscriber protocol and Publisher protocol
    - They support subscribing to a publisher, and sending results to any subscribers
    - Can be chained to process, transform data

### 11. [Combine part 2]()
- Subject
    - A publisher that exposes a method for outside callers to publish elements
        - https://developer.apple.com/documentation/combine/subject
    - A special case of publisher that also follows the Subject protocol.
    - Lets you inject values in a stream by calling a send method.
    - `func send()`
        - Sends a void value to the subscriber.
    - A way of emitting a single value whenever you say so.
    - Subjects can act as a conductor to send values from non-Combine imperative code to Combine subscribers.

- Built-in Subjects //24m
    - 🚪🛎 [PassthroughSubject](https://heckj.github.io/swiftui-notes/#reference-passthroughsubject) - Let's you publish new values on demand. They will pass along values and a completion event.
    - 🏠💡 [CurrentValueSubject](https://heckj.github.io/swiftui-notes/#reference-currentvaluesubject) - Lets you look at the current value of a publisher. 
    - [Analogy](https://stackoverflow.com/questions/60482737/what-is-passthroughsubject-currentvaluesubject)
        - PassthroughSubject: When someone rings the door, you are notified if you are at home (you are the subscriber)
        - CurrentValueSubject: If someone turns on the lights in your house when you are out, when you get back you'll find them turned on.
- Playground Demo
    - PassthroughSubject
    - CurrentValueSubject

### 12. [Combine with UIKit]()
- [`@Published`](https://developer.apple.com/documentation/combine/published) - A type that publishes a property marked with an attribute.
`@propertyWrapper struct Published<Value>`
    - Publishing a property with the @Published attribute creates a publisher of this type.
    - You access the publisher with the $ operator
    - Class constrained

### 13. Final Exam day

**Course Dates:** Wednesday, January 20 – Wednesday, March 3, 2021 (7 weeks)

**Class Times:** Monday, Wednesday at 9:30am–12:15pm (13 class sessions)

| Class |          Date          |                 Topics                  |
|:-----:|:----------------------:|:---------------------------------------:|
|  - |  Mon, Jan 18                 | No Class - MLK Day |
|  1 |  Wed, Jan 20              | [Creational Patterns Pt.1] & [Creational Patterns Pt.2]  |
|  2 |  Mon, Jan 25              | [Behavioral Patterns Pt.1] & [Behavioral Patterns Pt.2]  |
|  3 |  Wed, Jan 27              | [Structural Patterns Pt.1] |
|  4 |  Mon, Feb 1                 | [Structural Patterns Pt.2] & Project Kick-Off|
|  5 |  Wed, Feb 3               | [MVVM]  |
|  6 |  Mon, Feb 8               | [Coordinators] |
|  7 |  Wed, Feb 10              | [Functional Programming Pt.1] |
|  8 |  Mon, Feb 15              | [Functional Programming Pt.2] |
|  9 |  Wed, Feb 17              | Lab - Sharing Progress |
| 10 |  Mon, Feb 22              | [Combine Pt.1] |  
| 11 |  Wed, Feb 24              | [Combine Pt.2] |
| 12 |  Mon, Mar 1               | [Combine Pt.3] & Review |
| 13 |  Wed, Mar 3               | Final Exam  |

https://github.com/SamuelFolledo/MOB2.4-Advanced-Architecture-in-iOS/blob/master/static/combineGitHubDemo.gif

## Contact
- If you have any question, feel free to contact me via email: <samuelfolledo@gmail.com>
- Follow me at [LinkedIn](https://linkedin.com/in/samuelfolledo) or read my articles at [Medium](https://medium.com/@samuelfolledo)
- Check out my Make School [portfolio](https://www.makeschool.com/portfolio/samuelfolledo)
