//: [Previous](@previous)

import UIKit
import Combine

enum HTTPError: LocalizedError {
    case statusCode
}

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

struct Todo: Codable {
    let id: Int
    let title: String
    let completed: Bool
    let userId: Int
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

var cancellable: AnyCancellable?

cancellable = URLSession.shared.dataTaskPublisher(for: url)
.tryMap { output in
    guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
        throw HTTPError.statusCode
    }
    return output.data
}
.decode(type: [Post].self, decoder: JSONDecoder())
.eraseToAnyPublisher()
.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        break
    case .failure(let error):
        fatalError(error.localizedDescription)
    }
}, receiveValue: { posts in
    print(posts)
})


//: [Next](@next)
