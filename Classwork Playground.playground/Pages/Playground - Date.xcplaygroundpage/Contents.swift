//: [Previous](@previous)

import Foundation

let dateFormatter = DateFormatter()
let timeAsString : String = "12:30PM"
dateFormatter.dateFormat = "HH:mma"

let timeFromString = dateFormatter.date(from: timeAsString)

//MARK: - Examples

//let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "HH:mm:ss"
var dateFromStr = dateFormatter.date(from: "12:16:45")!

dateFormatter.dateFormat = "hh:mm:ss a 'on' MMMM dd, yyyy"
//Output: 12:16:45 PM on January 01, 2000

dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
//Output: Sat, 1 Jan 2000 12:16:45 +0600

dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//Output: 2000-01-01T12:16:45+0600

dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
//Output: Saturday, Jan 1, 2000

dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
//Output: 01-01-2000 12:16

dateFormatter.dateFormat = "MMM d, h:mm a"
//Output: Jan 1, 12:16 PM

dateFormatter.dateFormat = "HH:mm:ss.SSS"
//Output: 12:16:45.000

dateFormatter.dateFormat = "MMM d, yyyy"
//Output: Jan 1, 2000

dateFormatter.dateFormat = "MM/dd/yyyy"
//Output: 01/01/2000

dateFormatter.dateFormat = "hh:mm:ss a"
//Output: 12:16:45 PM

dateFormatter.dateFormat = "MMMM yyyy"
//Output: January 2000

dateFormatter.dateFormat = "dd.MM.yy"
//Output: 01.01.00

//Output: Customisable AP/PM symbols
dateFormatter.amSymbol = "am"
dateFormatter.pmSymbol = "Pm"
dateFormatter.dateFormat = "a"
//Output: Pm

// Usage
var timeFromDate = dateFormatter.string(from: dateFromStr)
print(timeFromDate)

//: [Next](@next)
