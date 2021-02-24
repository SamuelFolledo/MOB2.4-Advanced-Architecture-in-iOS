//: [Previous](@previous)

import Foundation
import Combine
/*:
 ## Create a phone number lookup
 
 Create a publisher that receives a string of 10 numbers or letters, looks up that number in you contacts
 
 Expected result:
 
 Contact not found for 000-000-1234
 Dialing Pizza Place (222-000-1234)...
 Contact not found for 888-000-1234
 Dialing Dentist (555-000-1234)...
 
 Hint: operators you'll need: `map`, `replaceNil` and `collect`
 
 */
let contacts = [
  "555-000-1234": "Dentist",
  "444-000-1234": "Landlord",
  "333-000-1234": "Physician",
  "222-000-1234": "Pizza Place"
]

func convert(phoneNumber: String) -> Int? {
  if let number = Int(phoneNumber),
    number < 10 {
    return number
  }

  let keyMap: [String: Int] = [
    "abc": 2, "def": 3, "ghi": 4,
    "jkl": 5, "mno": 6, "pqrs": 7,
    "tuv": 8, "wxyz": 9
  ]

  let converted = keyMap
    .filter { $0.key.contains(phoneNumber.lowercased()) }
    .map { $0.value }
    .first

  return converted
}

func format(digits: [Int]) -> String {
  var phone = digits.map(String.init)
                    .joined()

  phone.insert("-", at: phone.index(
    phone.startIndex,
    offsetBy: 3)
  )

  phone.insert("-", at: phone.index(
    phone.startIndex,
    offsetBy: 7)
  )

  return phone
}

func dial(phoneNumber: String) -> String {
  guard let contact = contacts[phoneNumber] else {
    return "Contact not found for \(phoneNumber)"
  }

  return "Dialing \(contact) (\(phoneNumber))..."
}

//: ### Answer: Creating publisher
let input = PassthroughSubject<String, Never>()

input
    .map(convert)
    .replaceNil(with: 0)
    .collect(10) //convert Int to [Int] with maximum 10 numbers
    .map(format)
    .map(dial)
    .sink(receiveValue: { print($0) })

///Send

"***0001234".forEach {
  input.send(String($0))
}

"2220001234".forEach {
  input.send(String($0))
}

"8880001234".forEach {
  input.send(String($0))
}

"jjj0001adg".forEach {
  input.send("\($0)")
}

//: [Next](@next)
