import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

func fetchRepos(forUsername username: String) {
    let urlString = "https://api.github.com/users/\(username)/repos"
    
    // URL 객체를 안전하게 처리
    guard let url = URL(string: urlString) else {
        print("❌ 잘못된 URL입니다.")
        return
    }
    
    var request = URLRequest(url: url)
    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
    
    let task = session.dataTask(with: request) { data, response, error in
        defer {
            PlaygroundPage.current.finishExecution()
        }
        
        // 네트워크 오류 처리
        if let error = error {
            print("❌ 네트워크 오류: \(error.localizedDescription)")
            return
        }
        
        // HTTP 응답 확인 (옵션: 상태 코드 확인 가능)
        if let httpResponse = response as? HTTPURLResponse {
            if !(200...299).contains(httpResponse.statusCode) {
                print("❌ HTTP 오류: 상태 코드 \(httpResponse.statusCode)")
                return
            }
        }
        
        // 데이터 언래핑
        guard let jsonData = data else {
            print("❌ 데이터가 없습니다.")
            return
        }
        
        // JSON 데이터 처리
        do {
            let deserialized = try JSONSerialization.jsonObject(with: jsonData, options: [])
            print("✅ 결과: \(deserialized)") // JSON 데이터를 출력합니다.
        } catch {
            print("❌ JSON 디코딩 실패: \(error.localizedDescription)")
        }
    }
    
    task.resume()
}

// GitHub 사용자 "apple"의 레포지토리 목록 가져오기
fetchRepos(forUsername: "apple")
