//: [Previous](@previous)


import Foundation

//: # Map
//: #### Exercise 1
/*: Taking a collection of data to transform it is a common task any iOS dev must do.
 
Take for example an array of students and their attendance to a course.
*/
let attendance = [
    (name: "Adriana", sessions: 8),
    (name: "Mitchell", sessions: 10),
    (name: "Joi", sessions: 13),
    (name: "Ian", sessions: 14),
    (name: "Jess", sessions: 0),
]
/*:
How would you transform the data to present readable sentences of their status in the course stored in an array?
 
Take the following conditions:
- If a student has <12 they are at risk
- Any other case, they are on track
 
Expected result:
 
["Adriana is at risk", "Mitchell is at risk", "Joi is on track", "Ian is on track", "Jess is at risk"]
*/
//Iterative version


//Functional version
let riskyAttendance = attendance.map{ $0.sessions < 12 ? "\($0.name) is at risk" : "\($0.name) is on track"}
print("Ex 1.1: ", riskyAttendance)

/*:
 Now you need a function that takes students and their attendance and return only the session value, sorter and with zeros filtered out (most likely those students withdrew).
*/

//Functional approach, try chaining functions together with a pipeline.
let sortedAttendance = attendance
    .filter {$0.sessions > 0}
    .sorted { $0.sessions > $1.sessions }
    .map{ $0.name }
print("Ex 1.2: ", sortedAttendance)

//: #### Exercise 2
/*:
Create a function that transforms the values in a dictionary for books. Each rating needs to be turned into human readable format.
*/
let bookRatings: [String: Float] = ["Atomic Habits": 5.0, "Getting Things Done": 4.5, "Grit": 4.0, "The Lean Startup": 3.9]

let readableBookRatings: [String: String] = bookRatings.mapValues{
    switch $0 {
    case 0..<1:
        return "Very weak"
    case 1..<2:
        return "Weak"
    case 2..<3:
        return "Good"
    case 3..<4:
        return "Very Good"
    case 4..<5:
        return "Excellent"
    case 5:
        return "Perfect"
    default:
        return "Unknown"
    }
}
print("Ex 2: ", readableBookRatings)
 
//: #### Exercise 3
/*:
The following code gets the street and city and cleans up the strings. See if you can reduce the code using map.
*/
let contact = ["address": ["zipcode": "94109","street":"post","city": "san francisco"]]

func capitalizedAndTrimmed(_ string: String) -> String {
    return string.trimmingCharacters(in: .whitespaces).capitalized
}

var capitalizedStreet: String? = nil
var capitalizedCity: String? = nil

if let address = contact["address"] {
    if let street = address["street"] {
        capitalizedStreet = capitalizedAndTrimmed(street.capitalized)
    }
    if let city = address["city"] {
        capitalizedCity = capitalizedAndTrimmed(city.capitalized)
    }
}

print(capitalizedStreet)
print(capitalizedCity)

// Cleaned up version

capitalizedStreet = contact["address"]?["street"].map{ capitalizedAndTrimmed($0) }
capitalizedCity = contact["address"]?["city"].map{ capitalizedAndTrimmed($0) }
print(capitalizedStreet!)
print(capitalizedCity!)

//: [Next](@next)
