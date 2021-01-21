//: [Previous](@previous)

/*:
 # [Factory Pattern Activity](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/02-Creational-PatternsPt.2/assignments/factory.md)
 
 In this scenario, you are given the task to code how UI components get created.

 UI components vary in color and typography depending on where they are located. For example, font weights and colors are not the same for menu buttons and buttons in the settings screen.

 But you were asked to create an easy interface for creating these UI components. Here's something you can try in a new Playground:

 Let's assume we can create these types of components:
 */

import UIKit

enum ComponentType {
    case button
    case label
    case image
}

//over simplified subclasses as examples
//when instantiated, these will be concrete products from the factory
class MenuButton: UIButton{}
class MenuLabel: UILabel{}
class MenuImage: UIImageView{}

protocol ComponentFactory {
    //this is the factory method
    func createView(component: ComponentType) -> UIView
}


//this class will be the creator
//it will apply logic and  decide what needs to be instantiated based on given arguments

class MenuComponentFactory: ComponentFactory {
    func createView(component: ComponentType) -> UIView {
        switch component {
        case .button:
            return MenuButton()
        case .label:
            return MenuLabel()
        case .image:
            return MenuImage()
        }
    }
}

//asks for a menu label
let menuFactory = MenuComponentFactory()
if let label = menuFactory.createView(component: .label) as? UILabel {
    print("Got my label \(label)")
} else {
    print("Couldnt create a UILabel from UIView")
}

/*:
 1️⃣ Complete the implementation of UI components in the settings screen.

 2️⃣ Read [this tip](https://www.swiftbysundell.com/tips/creating-extensions-with-static-factory-methods/) on working with static factory methods.

 3️⃣ Write in the chat any questions you might have or if you are done let the instructor know.

 [Resource for activity](https://levelup.gitconnected.com/factory-method-pattern-in-swift-1f1b73488072)
 */

//: [Next](@next)
