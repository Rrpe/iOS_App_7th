import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

func fetchRepos(forUsername username: String) async throws {
    let urlString = "https://api.github.com/users/\(username)/repos"
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url)
    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
//    request.setValue("SwiftPlayground", forHTTPHeaderField: "User-Agent")
    
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let deserialized = try JSONSerialization.jsonObject(with: data, options: [])
        print(deserialized)
    } catch {
        print(error)
    }
}

Task {
    try await fetchRepos(forUsername: "apple")
}
