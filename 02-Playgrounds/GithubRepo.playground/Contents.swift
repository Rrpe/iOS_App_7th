import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum ResponsError: Error {
    case requestFailed
    case unexpectedResponseStructure
}

func fetchRepos(forUsername username: String,
                completionHandler: @escaping ([[String: Any]]?, ResponsError?) -> Void) async {
    let urlString = "https://api.github.com/users/\(username)/repos"
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url)
    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
//    request.setValue("SwiftPlayground", forHTTPHeaderField: "User-Agent")
    
    do {
        // 비동기 실행 이전
        let (data, _) = try await URLSession.shared.data(for: request)
        // 비동기 실행 이후
        let deserialized = try JSONSerialization.jsonObject(with: data, options: [])
        guard let repos = deserialized as? [[String: Any]] else {
            completionHandler(nil, .unexpectedResponseStructure)
            return
        }
        completionHandler(repos, nil)
    } catch {
        print(error)
        completionHandler(nil, .requestFailed)
    }
}

Task {
    await fetchRepos(forUsername: "apple") { repos, error in
        if let error {
            print("error!")
            return
        }
        print("Repos: \(repos!.count)")
    }
}
