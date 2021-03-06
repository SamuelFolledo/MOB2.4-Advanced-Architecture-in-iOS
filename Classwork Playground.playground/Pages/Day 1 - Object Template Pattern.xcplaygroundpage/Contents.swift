//: [Previous](@previous)

/*:
 # [Object Template Acivity](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/01-Creational-PatternsPt.1/assignments/template.md)
 ## In Pairs
 The following code sets up an array of tuples each representing a specific product:
 */

import Foundation

var products = [
   ("Kayak", "A boat for one person", 275.0, 10),
   ("Lifejacket", "Protective and fashionable", 48.95, 14),
   ("Soccer Ball", "FIFA-approved size and weight", 19.5, 32)]

func calculateTax(product:(String, String, Double, Int)) -> Double {
   return product.2 * 0.2;
}

func calculateStockValue(tuples:[(String, String, Double, Int)]) -> Double {
   return tuples.reduce(0, {
       (total, product) -> Double in
       return total + (product.2 * Double(product.3))
   })
}

print("Sales tax for Kayak: $\(calculateTax(product: products[0]))")
print("Total value of stock: $\(calculateStockValue(tuples: products))")

/*:
 Q: If we remove an element from each of the tuples, how will that effect the rest of the code?
 A: You would have to change lots of code everywhere, making it hard to maintain
 
 ## TODOs:

 1. Have one person validate the code by running it in a playground just as it is.
 2. For each of the tuples in the array, remove the second element - the element which describes the product - so that your array now looks like this:
 
 var products = [
    (“Kayak”, 275.0, 10),
    (“Lifejacket”, 48.95, 14),
    (“Soccer Ball”, 19.5, 32)]
 */



/*:
 3. Analyze and discuss with your partner the various places in the code which must now be rewritten to accommodate this change to the product tuples.
 - Also discuss what this reveals regarding the impact of tuples on extending and maintaining code.
 - **Tuples itself is really hard to maintain unless we know for sure its properties will not change**
 4. Now, validate your analysis by applying your proposed fixes to the code in the playground (each person should do this separately in their own playground)
 - **Turning tuple into its own `class` or `struct` can help improve this code**
 */

struct Product {
    var name: String
    var description: String
    var price: Double
    var stock: Int
    
    init(name: String = "", description: String = "", price: Double = 0.0, stock: Int = 0) {
        self.name = name
        self.description = description
        self.price = price
        self.stock = stock
    }
}

var updatedProducts: [Product] = [
    Product(name: "Kayak", description: "A boat for one person", price: 275.0, stock: 10),
    Product(name: "Lifejacket", description: "Protective and fashionable", price: 48.95, stock: 14),
    Product(name: "Lifejacket", description: "FIFA-approved size and weight", price: 19.5, stock: 32),
]

func updatedCalculateTax(product: Product) -> Double {
   return product.price * 0.2;
}

func updatedCalculateStockValue(products: [Product]) -> Double {
   return products.reduce(0, {
       (total, product) -> Double in
       return total + (product.price * Double(product.stock))
   })
}

print("Sales tax for Kayak: $\(updatedCalculateTax(product: updatedProducts[0]))")
print("Total value of stock: $\(updatedCalculateStockValue(products: updatedProducts))")


//: [Next](@next)
