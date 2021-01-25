//: [Previous](@previous)
/*:
 # [Command Pattern - Activity](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/03-Behavioral-PatternsPt.1/assignments/command.md)
 TODO: Below is a simple example of the Command pattern which models a real-world television remote control device. Complete the implementation so that sending commands to turn the TV on or off work successfully.
 */
import UIKit

// Receiver - Waiter
class TelevisionControl {
    func turnOn() {
        print("Turning On TV")
    }
    func turnOff() {
        print("Turning Off TV")
    }
}

// Command - list of paper/order
protocol TelevisionCommand {
    func execute()
}

class TurnOnTelevision: TelevisionCommand {
    
    // TODO: Complete implementation...
    public let televisionControl: TelevisionControl
    
    public init(_ televisionControl: TelevisionControl) {
        self.televisionControl = televisionControl
    }
    public func execute() {
        self.televisionControl.turnOn()
    }
}

class TurnOffTelevision: TelevisionCommand {
    public let televisionControl: TelevisionControl
    
    public init(_ televisionControl: TelevisionControl) {
        self.televisionControl = televisionControl
    }
    public func execute() {
        self.televisionControl.turnOff()
    }
}

// Invoker - Chef
class RemoteControl {
    
    public let televisionControl: TelevisionControl
    
    // TODO: create Init()
    init(televisionControl: TelevisionControl) {
        self.televisionControl = televisionControl
    }
    
    func execute(_ command: TelevisionCommand) {
        // TODO: complete execute() function
        command.execute()
    }
}

let televisionControl = TelevisionControl()
let remoteControl = RemoteControl(televisionControl: televisionControl)
let turnOffTelevision = TurnOffTelevision(televisionControl)
remoteControl.execute(turnOffTelevision)

let turnOnTelevision = TurnOnTelevision(televisionControl)
remoteControl.execute(turnOnTelevision)
//: [Next](@next)
