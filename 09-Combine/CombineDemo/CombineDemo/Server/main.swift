//
//  main.swift
//  SimpleServer
//
//  Created by KimJunsoo on 4/7/25.
//
//  !!! 여기 프로젝트에서 생성 후 실행 XXX !!!
//  New Project -> masOS -> Command Line Tool 생성 -> 코드 cv -> cmd + R (실행)
//  XXX =================== 필 독 =================== XXX

import Foundation

// 사용 불가능한 사용자 이름 목록
let unavailableUsernames = ["rrpe", "johnnyappleseed", "page", "johndoe", "junsoo"]

class UserNameServer {
    
    // 서버 주소와 포트
    private let serverAddress: String
    private let port: UInt16
    private var server: HTTPServer?
    
    init(serverAddress: String = "127.0.0.1", port: UInt16 = 8080) {
        self.serverAddress = serverAddress
        self.port = port
    }
    
    func start() {
        do {
            // HTTP 서버 인스턴스 생성
            server = HTTPServer()
            
            // 요청 핸들러 등록
            server?.delegate = UserNameHandler()
            
            // 서버 시작
            try server?.start(port: Int(port), address: serverAddress)
            
            // 서버 정보 출력
            print("서버가 시작되었습니다: http://\(serverAddress):\(port)")
            print("사용 가능한 엔드포인트:")
            print("  GET http://\(serverAddress):\(port)/isUserNameAvailable?userName=<사용자이름>")
            print("\n테스트를 위한 사용 불가능한 사용자 이름:")
            for name in unavailableUsernames {
                print("  - \(name)")
            }
            print("\n서버를 중지하려면 Ctrl+C를 누르세요.")
            
            // 메인 스레드에서 RunLoop 유지
            RunLoop.current.run()
        } catch {
            print("서버 시작 중 오류 발생: \(error)")
        }
    }
    
    func stop() {
        server?.stop()
        print("\n서버가 종료되었습니다.")
    }
}

// HTTP 서버 클래스
class HTTPServer: NSObject {
    private var listeningSocket: CFSocket?
    private var runLoopSource: CFRunLoopSource?
    var delegate: HTTPServerDelegate?
    
    func start(port: Int, address: String) throws {
        var sin = sockaddr_in()
        sin.sin_family = sa_family_t(AF_INET)
        sin.sin_port = CFSwapInt16HostToBig(UInt16(port))
        sin.sin_addr.s_addr = inet_addr(address)
        
        var context = CFSocketContext(version: 0, info: Unmanaged.passUnretained(self).toOpaque(), retain: nil, release: nil, copyDescription: nil)
        
        listeningSocket = CFSocketCreate(kCFAllocatorDefault, AF_INET, SOCK_STREAM, IPPROTO_TCP, CFSocketCallBackType.acceptCallBack.rawValue, { socket, callbackType, address, data, info in
            let server = Unmanaged<HTTPServer>.fromOpaque(info!).takeUnretainedValue()
            let nativeSocket = CFSocketGetNative(socket)
            
            var clientAddress = sockaddr()
            var clientAddressLength = socklen_t(MemoryLayout<sockaddr>.size)
            
            let clientSocket = accept(nativeSocket, &clientAddress, &clientAddressLength)
            if clientSocket >= 0 {
                server.handleClientConnection(clientSocket: clientSocket)
            }
        }, &context)
        
        guard let listeningSocket = listeningSocket else {
            throw NSError(domain: "HTTPServer", code: -1, userInfo: [NSLocalizedDescriptionKey: "소켓 생성 실패"])
        }
        
        let socketData = Data(bytes: &sin, count: MemoryLayout<sockaddr_in>.size)
        if CFSocketSetAddress(listeningSocket, socketData as CFData) != .success {
            throw NSError(domain: "HTTPServer", code: -2, userInfo: [NSLocalizedDescriptionKey: "소켓 바인딩 실패"])
        }
        
        runLoopSource = CFSocketCreateRunLoopSource(kCFAllocatorDefault, listeningSocket, 0)
        if let runLoopSource = runLoopSource {
            CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .defaultMode)
        } else {
            throw NSError(domain: "HTTPServer", code: -3, userInfo: [NSLocalizedDescriptionKey: "RunLoop 소스 생성 실패"])
        }
    }
    
    func stop() {
        if let runLoopSource = runLoopSource {
            CFRunLoopSourceInvalidate(runLoopSource)
            self.runLoopSource = nil
        }
        
        if let listeningSocket = listeningSocket {
            CFSocketInvalidate(listeningSocket)
            self.listeningSocket = nil
        }
    }
    
    private func handleClientConnection(clientSocket: Int32) {
        // 클라이언트 연결 처리를 별도 스레드에서 실행
        DispatchQueue.global().async {
            let connection = HTTPConnection(socket: clientSocket, delegate: self.delegate)
            connection.processRequest()
        }
    }
}

// HTTP 서버 대리자 프로토콜
protocol HTTPServerDelegate: AnyObject {
    func handleRequest(_ request: HTTPRequest) -> HTTPResponse
}

// HTTP 연결 클래스
class HTTPConnection {
    private let socket: Int32
    private weak var delegate: HTTPServerDelegate?
    
    init(socket: Int32, delegate: HTTPServerDelegate?) {
        self.socket = socket
        self.delegate = delegate
    }
    
    deinit {
        close(socket)
    }
    
    func processRequest() {
        // 요청 데이터 읽기
        var requestData = Data()
        let bufferSize = 1024
        var buffer = [UInt8](repeating: 0, count: bufferSize)
        
        // 헤더 읽기
        while true {
            let bytesRead = recv(socket, &buffer, bufferSize, 0)
            if bytesRead <= 0 {
                close(socket)
                return
            }
            
            requestData.append(buffer, count: bytesRead)
            
            // HTTP 헤더의 끝을 찾음 (\r\n\r\n)
            if let requestString = String(data: requestData, encoding: .utf8),
               requestString.contains("\r\n\r\n") {
                break
            }
        }
        
        // 요청 문자열로 변환
        guard let requestString = String(data: requestData, encoding: .utf8) else {
            sendResponse(HTTPResponse(statusCode: 400, body: "잘못된 요청"))
            return
        }
        
        // HTTP 요청 파싱
        let request = parseRequest(requestString)
        
        // 대리자에게 요청 처리 위임
        if let delegate = delegate {
            let response = delegate.handleRequest(request)
            sendResponse(response)
        } else {
            sendResponse(HTTPResponse(statusCode: 500, body: "서버 오류"))
        }
    }
    
    private func parseRequest(_ requestString: String) -> HTTPRequest {
        let lines = requestString.components(separatedBy: "\r\n")
        let firstLine = lines.first?.components(separatedBy: " ") ?? []
        
        let method = firstLine.count > 0 ? firstLine[0] : ""
        let urlString = firstLine.count > 1 ? firstLine[1] : ""
        
        // URL과 쿼리 파라미터 파싱
        var path = ""
        var queryParams: [String: String] = [:]
        
        if let urlComponents = URLComponents(string: urlString) {
            path = urlComponents.path
            if let queryItems = urlComponents.queryItems {
                for item in queryItems {
                    queryParams[item.name] = item.value ?? ""
                }
            }
        }
        
        return HTTPRequest(method: method, path: path, queryParams: queryParams)
    }
    
    private func sendResponse(_ response: HTTPResponse) {
        // HTTP 응답 헤더 생성
        var responseString = "HTTP/1.1 \(response.statusCode) \(statusCodeDescription(response.statusCode))\r\n"
        
        // 헤더 추가
        for (key, value) in response.headers {
            responseString += "\(key): \(value)\r\n"
        }
        
        // 빈 줄로 헤더와 본문 구분
        responseString += "\r\n"
        
        // 응답 헤더 전송
        if let headerData = responseString.data(using: .utf8) {
            _ = headerData.withUnsafeBytes { bufferPointer in
                send(socket, bufferPointer.baseAddress, headerData.count, 0)
            }
        }
        
        // 응답 본문 전송
        if let bodyData = response.body.data(using: .utf8) {
            _ = bodyData.withUnsafeBytes { bufferPointer in
                send(socket, bufferPointer.baseAddress, bodyData.count, 0)
            }
        }
        
        // 연결 종료
        close(socket)
    }
    
    private func statusCodeDescription(_ statusCode: Int) -> String {
        switch statusCode {
        case 200: return "OK"
        case 404: return "Not Found"
        case 400: return "Bad Request"
        case 500: return "Internal Server Error"
        default: return "Unknown"
        }
    }
}

// HTTP 요청 구조체
struct HTTPRequest {
    let method: String
    let path: String
    let queryParams: [String: String]
}

// HTTP 응답 구조체
struct HTTPResponse {
    let statusCode: Int
    var headers: [String: String] = ["Content-Type": "text/plain"]
    let body: String
    
    init(statusCode: Int, headers: [String: String] = [:], body: String) {
        self.statusCode = statusCode
        self.body = body
        
        // 기본 헤더에 사용자 지정 헤더 병합
        for (key, value) in headers {
            self.headers[key] = value
        }
        
        // Content-Length 헤더 추가
        if let bodyData = body.data(using: .utf8) {
            self.headers["Content-Length"] = "\(bodyData.count)"
        }
    }
}

// 사용자 이름 가용성 핸들러
class UserNameHandler: HTTPServerDelegate {
    func handleRequest(_ request: HTTPRequest) -> HTTPResponse {
        // isUserNameAvailable 엔드포인트 처리
        if request.path == "/isUserNameAvailable" {
            // userName 파라미터 확인
            if let userName = request.queryParams["userName"] {
                // 요청 로깅
                print("사용자 이름 가용성 확인: \(userName)")
                
                // 사용자 이름 가용성 확인
                let isAvailable = !unavailableUsernames.contains(userName)
                
                // JSON 응답 생성
                let response: [String: Any] = [
                    "isAvailable": isAvailable,
                    "userName": userName
                ]
                
                // 응답 JSON 직렬화
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: response, options: [])
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        return HTTPResponse(
                            statusCode: 200,
                            headers: ["Content-Type": "application/json"],
                            body: jsonString
                        )
                    }
                } catch {
                    print("JSON 직렬화 오류: \(error)")
                }
            }
        }
        
        // 일치하는 엔드포인트가 없거나 오류 발생 시 404 반환
        return HTTPResponse(statusCode: 404, body: "Not Found")
    }
}

// 메인 함수에서 서버 실행
func runServer() {
    // 시그널 핸들러 등록
    signal(SIGINT) { _ in
        print("\n서버 종료 중...")
        exit(0)
    }
    
    // 서버 인스턴스 생성 및 시작
    let server = UserNameServer()
    server.start()
}

// 서버 실행
runServer()
