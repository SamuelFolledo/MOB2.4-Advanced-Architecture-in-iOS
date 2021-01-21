//: [Previous](@previous)

import Foundation

/*:
 # [Builder Assignment](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/02-Creational-PatternsPt.2/assignments/builder.md)
 The code below uses the Builder pattern (with a Director) to standardize the creation of three types of bicycles.
 
 The implementation for the Kids bike is already complete.
 
 Your job is to complete the code so that the remaining two bicycle types can also be created.
 
 ### Useful Examples
 - [Widget example](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/02-Creational-PatternsPt.2/assignments/widget.md)
 - [Burger example](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/02-Creational-PatternsPt.2/assignments/burgerExample.md)
 
 */

import UIKit

enum BicycleSize: String {
    case small
    case medium
    case large
}

enum BicycleType: String {
    case kids
    case standard
    case mountain
}

//MARK: - Bicycle
struct Bicycle {
    public let type: BicycleType
    public let color: UIColor
    public let size: BicycleSize
}

extension Bicycle: CustomStringConvertible {
    public var description: String {
        return type.rawValue + " bicycle"
    }
}

// MARK: - Builder Protocol
protocol BikeBuilder {
    var type: BicycleType { get set }
    var color: UIColor { get set }
    var size: BicycleSize { get set }
    
    func construct() -> Bicycle
}

// MARK: - Builder
class BicycleBuilder: BikeBuilder {
    
    var type: BicycleType = .standard
    var color: UIColor = .gray
    var size: BicycleSize = .medium
    
    func construct() -> Bicycle {
        return Bicycle(type: type, color: color, size: size)
    }
}

// MARK: - Director
public class BikeAssembler {
    
    // Build a kids bike
    func createKidsBike() -> Bicycle {
        let builder = BicycleBuilder()
        builder.type = .kids
        builder.size = .small
        return builder.construct()
    }
    
    // TODO: 1) build the Mountain bike
    func createMountainBike() -> Bicycle {
        let builder = BicycleBuilder()
        builder.type = .standard
        builder.size = .large
        return builder.construct()
    }
    
    // TODO: 2) the Standard bike
    func createStandardBike() -> Bicycle {
        let builder = BicycleBuilder()
        builder.type = .standard
        builder.size = .medium
        return builder.construct()
    }
}

let bikeAssembler = BikeAssembler()
let kids = bikeAssembler.createKidsBike()
print(kids.description)

//: [Next](@next)
