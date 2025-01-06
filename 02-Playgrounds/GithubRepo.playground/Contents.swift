import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum ResponsError: Error {
    case requestFailed
    case unexpectedResponseStructure
}

/// @escaping : 비동기 작업에서 클로저가 함수의 실행이 종료된 후에도 호출이 될 수 있음을 나타냄
/// [[String: Any]]? : 배열로 구성된 JSON 데이터를 나타냄. ?를 써서 옵셔널 타입 선언
/// -> Void : 클로저 결과만 전달하고 아무 값도 반환 하지 않음을 나타냄
/// async : 함수가 비동기 작업을 포함한다는 것을 나타냄. await 키워드 호출 필수
/// completionHandler : 비동기 작업 결과를 전달하기 위해 사용됨
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
    await fetchRepos(forUsername: "Rrpe") { repos, error in
        if let error {
            print("Error: \(error)")
            return
        }
        print("Repos: \(repos!.count)")
    }
}
