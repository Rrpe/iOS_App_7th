import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// -> Void 반환값 Void 는 생략 가능
func fetchRepos(forUsername username: String) {
    let urlString = "https://api.github.com/users/\(username)/repos"
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
    
    let task = session.dataTask(with: request) { (data, response, error) in
        // 이 응답을 처리한 후 플레이그라운드 실행을 마칠 수 있습니다
        defer {
            PlaygroundPage.current.finishExecution()
        }
        
        // 먼저 옵셔널 데이터를 언래핑합니다
        guard let jsonData = data else {
            // 데이터가 nil이면 아마도 네트워크 오류일 것입니다
            print(error ?? "Network Error")
            return
        }
        
        do {
            // 역직렬화는 오류를 throw할 수 있으므로 'try'를 사용하고 오류를 catch해야 합니다
            let deserialized = try JSONSerialization.jsonObject(with: jsonData, options: [])
            print(deserialized)
        } catch {
            print(error)
        }
    }
    
    task.resume()
}
fetchRepos(forUsername: "apple")
