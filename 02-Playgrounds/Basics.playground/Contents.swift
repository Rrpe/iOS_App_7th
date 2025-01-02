import Foundation

//runOptional() // 옵티널
//runFunction() // 함수
//runClass() // 클래스
//runStruct() // 구조체
//runEnun() // 열거형
//runClosure() // 클로저
//runProtocol() // 프로토콜

struct Pug {
    let name: String
}

let pugs = [Pug]()

typealias Grumble = [Pug]

var grumble = Grumble()

let marty = Pug(name: "Marty")
let wolfie = Pug(name: "Wolfie")
let buddy = Pug(name: "Buddy")

grumble.append(contentsOf: [marty, wolfie, buddy])
print(grumble)

enum Channel {
    case BBC1
    case BBC2
    case BBCNews
    // ...
}

class ProgramFetcher {
    typealias FetchResultHandler = (String?, Error?) -> Void
    
    func fetchCurrentProgramName(forChannel channel: Channel, resultHandler: FetchResultHandler) {
        // 현재 프로그램을 가져오는 작업 수행
        let exampleProgramName = "Sherlock"
        resultHandler(exampleProgramName, nil)
        // 프로그램 정보가 없을 때 예시
        // resultHandler(nil, nil)
    }
    func fetchNextProgramName(forChannel channel: Channel, resultHandler: FetchResultHandler) {
        // 다음 프로그램을 가져오는 작업 수행
        let exampleProgramName = "Doctor Who"
        resultHandler(exampleProgramName, nil)
    }
}

let fetcher = ProgramFetcher()

// 타입별칭의 풀네임
fetcher.fetchCurrentProgramName(forChannel: .BBC1, resultHandler: { programName, error in
        guard let programName else {
        print("No program name")
        return
    }
    guard error == nil else {
        print("Error: \(error!)")
        return
    }
    print(programName)
})

fetcher.fetchNextProgramName(forChannel: .BBCNews, resultHandler: { programName, error in
    guard let programName else {
        print("No program name")
        return
    }
    guard error == nil else {
        print("Error: \(error!)")
        return
    }
    print(programName)
})
