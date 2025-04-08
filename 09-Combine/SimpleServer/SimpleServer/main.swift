//
//  main.swift
//  SimpleServer
//
//  Created by KimJunsoo on 4/7/25.
//

import Foundation

// 사용 불가능한 사용자 이름 목록
let unavailableUsernames = ["jmbae", "johnnyappleseed", "page", "johndoe", "rrpe"]

class UserNameServer {
    // 유지보수 카운터 (static 변수로 유지)
    private static var maintenanceCounter = 0
    
    // 서버 실행
    func run(port: UInt16 = 8080) {
        let server = HTTPServer(port: port)
        server.delegate = self
        
        print("Starting username availability server at http://127.0.0.1:\(port)")
        print("Available endpoints:")
        print("  GET http://127.0.0.1:\(port)/isUserNameAvailable?userName=<username>")
        print("\nUnavailable usernames for testing:")
        for name in unavailableUsernames {
            print("  - \(name)")
        }
        print("\n서버를 중지하려면 Ctrl+C를 누르세요.")
        
        do {
            try server.start()
            // 프로그램이 종료되지 않도록 유지
            RunLoop.current.run()
        } catch {
            print("서버 시작 중 오류 발생: \(error)")
        }
    }
}

// HTTPServer 클래스의 델리게이트 구현
extension UserNameServer: HTTPServerDelegate {
    func handleRequest(_ request: HTTPRequest, responseHandler: @escaping (HTTPResponse) -> Void) {
        // URL 경로 확인
        guard request.url.path == "/isUserNameAvailable" else {
            // 404 Not Found
            let response = HTTPResponse(statusCode: 404, body: "Not Found".data(using: .utf8)!)
            responseHandler(response)
            return
        }
        
        // 쿼리 파라미터 추출
        guard let components = URLComponents(url: request.url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems,
              let userNameItem = queryItems.first(where: { $0.name == "userName" }),
              let username = userNameItem.value else {
            // 400 Bad Request
            let response = HTTPResponse(statusCode: 400, body: "Bad Request: userName이 없습니다.".data(using: .utf8)!)
            responseHandler(response)
            return
        }
        
        // 금지된 사용자 이름 확인
        if ["admin", "superuser"].contains(username) {
            let errorResponse: [String: Any] = [
                "error": true,
                "reason": "Username is not valid: \(username)."
            ]
            let jsonData = try! JSONSerialization.data(withJSONObject: errorResponse)
            let response = HTTPResponse(
                statusCode: 400,
                headers: ["Content-Type": "application/json"],
                body: jsonData
            )
            responseHandler(response)
            return
        }
        
        // 서버 에러 시뮬레이션 - 데이터베이스 손상
        if username == "servererror" {
            let errorResponse: [String: Any] = [
                "error": true,
                "reason": "The database is corrupted"
            ]
            let jsonData = try! JSONSerialization.data(withJSONObject: errorResponse)
            let response = HTTPResponse(
                statusCode: 500,
                headers: ["Content-Type": "application/json"],
                body: jsonData
            )
            responseHandler(response)
            return
        }
        
        // 유지보수 에러 시뮬레이션
        if username == "maintenance" {
            UserNameServer.maintenanceCounter += 1
            print("Maintenance counter: \(UserNameServer.maintenanceCounter)")
            
            if UserNameServer.maintenanceCounter % 3 != 0 {
                print("... throwing maintenance error")
                let errorResponse: [String: Any] = [
                    "error": true,
                    "reason": "Temporarily unavailable for maintenance"
                ]
                let jsonData = try! JSONSerialization.data(withJSONObject: errorResponse)
                let response = HTTPResponse(
                    statusCode: 500,
                    headers: [
                        "Content-Type": "application/json",
                        "Retry-After": "120"
                    ],
                    body: jsonData
                )
                responseHandler(response)
                return
            } else {
                print("... NOT throwing maintenance error")
            }
        }
        
        // 항상 유지보수 에러
        if username == "maintenance!" {
            let errorResponse: [String: Any] = [
                "error": "Internal Server Error",
                "reason": "Temporarily unavailable for maintenance"
            ]
            let jsonData = try! JSONSerialization.data(withJSONObject: errorResponse)
            let response = HTTPResponse(
                statusCode: 500,
                headers: [
                    "Content-Type": "application/json",
                    "Retry-After": "120"
                ],
                body: jsonData
            )
            responseHandler(response)
            return
        }
        
        // 잘못된 응답 형식 시뮬레이션
        if username == "illegalresponse" {
            let result: [String: Any] = ["isAvailable": false]
            let jsonData = try! JSONSerialization.data(withJSONObject: result)
            let response = HTTPResponse(
                statusCode: 200,
                headers: ["Content-Type": "application/json"],
                body: jsonData
            )
            responseHandler(response)
            return
        }
        
        // 사용자 이름이 비어있는지 확인
        if username.isEmpty {
            let response = HTTPResponse(
                statusCode: 400,
                body: "Bad Request: userName 이 비어있습니다.".data(using: .utf8)!
            )
            responseHandler(response)
            return
        }
        
        // 사용자 이름이 3자 이상인지 확인
        if username.count < 3 {
            let response = HTTPResponse(
                statusCode: 400,
                body: "Bad Request: userName은 최소 3자 이상이어야 합니다.".data(using: .utf8)!
            )
            responseHandler(response)
            return
        }
        
        // 요청 로깅
        print("Checking availability for username: \(username)")
        
        // 사용자 이름이 사용 불가능한 목록에 있는지 확인
        let isAvailable = !unavailableUsernames.contains(username)
        
        // JSON 응답 생성
        let responseDict: [String: Any] = [
            "isAvailable": isAvailable,
            "userName": username
        ]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: responseDict)
        
        // HTTP 응답 헤더 설정
        let response = HTTPResponse(
            statusCode: 200,
            headers: ["Content-Type": "application/json"],
            body: jsonData
        )
        
        responseHandler(response)
    }
}

// MARK: - HTTP 서버 구현
class HTTPServer {
    weak var delegate: HTTPServerDelegate?
    private let port: UInt16
    private var serverSocket: Int32 = -1
    private var isRunning = false
    
    init(port: UInt16) {
        self.port = port
    }
    
    deinit {
        stop()
    }
    
    func start() throws {
        // 소켓 생성
        serverSocket = socket(AF_INET, SOCK_STREAM, 0)
        if serverSocket == -1 {
            throw HTTPServerError.socketCreationFailed
        }
        
        // 소켓 옵션 설정 (주소 재사용)
        var value: Int32 = 1
        if setsockopt(serverSocket, SOL_SOCKET, SO_REUSEADDR, &value, socklen_t(MemoryLayout<Int32>.size)) == -1 {
            close(serverSocket)
            throw HTTPServerError.socketOptionFailed
        }
        
        // 주소 바인딩
        var addr = sockaddr_in()
        addr.sin_family = sa_family_t(AF_INET)
        addr.sin_port = UInt16(port).bigEndian
        addr.sin_addr.s_addr = INADDR_ANY.bigEndian
        
        let addrPtr = withUnsafePointer(to: &addr) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { $0 }
        }
        
        if bind(serverSocket, addrPtr, socklen_t(MemoryLayout<sockaddr_in>.size)) == -1 {
            close(serverSocket)
            throw HTTPServerError.bindFailed
        }
        
        // 리스닝 시작
        if listen(serverSocket, 128) == -1 {
            close(serverSocket)
            throw HTTPServerError.listenFailed
        }
        
        isRunning = true
        
        // 백그라운드 큐에서 연결 수락
        DispatchQueue.global(qos: .background).async {
            self.acceptConnections()
        }
    }
    
    func stop() {
        if serverSocket != -1 {
            close(serverSocket)
            serverSocket = -1
        }
        isRunning = false
    }
    
    private func acceptConnections() {
        while isRunning {
            var addr = sockaddr_in()
            var addrLen = socklen_t(MemoryLayout<sockaddr_in>.size)
            
            let addrPtr = withUnsafeMutablePointer(to: &addr) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { $0 }
            }
            
            let clientSocket = accept(serverSocket, addrPtr, &addrLen)
            if clientSocket == -1 {
                if isRunning {
                    print("연결 수락 실패")
                }
                continue
            }
            
            // 클라이언트 연결 처리를 위한 새 스레드
            DispatchQueue.global(qos: .utility).async {
                self.handleClient(socket: clientSocket)
            }
        }
    }
    
    private func handleClient(socket: Int32) {
        defer {
            close(socket)
        }
        
        var buffer = [UInt8](repeating: 0, count: 4096)
        let bytesRead = recv(socket, &buffer, buffer.count, 0)
        
        if bytesRead <= 0 {
            return
        }
        
        let data = Data(bytes: buffer, count: bytesRead)
        
        if let requestString = String(data: data, encoding: .utf8),
           let request = parseHTTPRequest(requestString) {
            
            delegate?.handleRequest(request) { response in
                self.sendResponse(response, to: socket)
            }
        } else {
            // 잘못된 요청
            let badRequestResponse = HTTPResponse(
                statusCode: 400,
                body: "Bad Request".data(using: .utf8)!
            )
            sendResponse(badRequestResponse, to: socket)
        }
    }
    
    private func parseHTTPRequest(_ requestString: String) -> HTTPRequest? {
        let lines = requestString.components(separatedBy: "\r\n")
        guard !lines.isEmpty else { return nil }
        
        let requestLine = lines[0].components(separatedBy: " ")
        guard requestLine.count >= 3 else { return nil }
        
        let method = requestLine[0]
        let urlString = requestLine[1]
        
        guard let url = URL(string: "http://127.0.0.1\(urlString)") else { return nil }
        
        var headers = [String: String]()
        var i = 1
        while i < lines.count && !lines[i].isEmpty {
            let headerParts = lines[i].components(separatedBy: ": ")
            if headerParts.count == 2 {
                headers[headerParts[0]] = headerParts[1]
            }
            i += 1
        }
        
        let bodyStartIndex = i + 1
        var body: Data?
        if bodyStartIndex < lines.count {
            let bodyString = lines[bodyStartIndex...].joined(separator: "\r\n")
            body = bodyString.data(using: .utf8)
        }
        
        return HTTPRequest(method: method, url: url, headers: headers, body: body)
    }
    
    private func sendResponse(_ response: HTTPResponse, to socket: Int32) {
        var responseString = "HTTP/1.1 \(response.statusCode) \(statusCodeDescription(response.statusCode))\r\n"
        
        // 기본 헤더 추가
        var headers = response.headers
        headers["Server"] = "Swift HTTP Server"
        headers["Date"] = currentDateString()
        headers["Content-Length"] = "\(response.body.count)"
        
        // 헤더 추가
        for (key, value) in headers {
            responseString += "\(key): \(value)\r\n"
        }
        
        responseString += "\r\n"
        
        guard let headerData = responseString.data(using: .utf8) else { return }
        
        // 헤더 전송
        _ = headerData.withUnsafeBytes {
            send(socket, $0.baseAddress, headerData.count, 0)
        }
        
        // 본문 전송
        _ = response.body.withUnsafeBytes {
            send(socket, $0.baseAddress, response.body.count, 0)
        }
    }
    
    private func statusCodeDescription(_ statusCode: Int) -> String {
        switch statusCode {
        case 200: return "OK"
        case 400: return "Bad Request"
        case 404: return "Not Found"
        case 500: return "Internal Server Error"
        default: return "Unknown"
        }
    }
    
    private func currentDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        return formatter.string(from: Date())
    }
}

// MARK: - 데이터 모델
struct HTTPRequest {
    let method: String
    let url: URL
    let headers: [String: String]
    let body: Data?
}

struct HTTPResponse {
    let statusCode: Int
    let headers: [String: String]
    let body: Data
    
    init(statusCode: Int, headers: [String: String] = [:], body: Data) {
        self.statusCode = statusCode
        self.headers = headers
        self.body = body
    }
}

// MARK: - 프로토콜 및 오류 정의
protocol HTTPServerDelegate: AnyObject {
    func handleRequest(_ request: HTTPRequest, responseHandler: @escaping (HTTPResponse) -> Void)
}

enum HTTPServerError: Error {
    case socketCreationFailed
    case socketOptionFailed
    case bindFailed
    case listenFailed
}

// 메인 함수
func main() {
    let server = UserNameServer()
    server.run(port: 8080)
}

// 프로그램 실행
main()
