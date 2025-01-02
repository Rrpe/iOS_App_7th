//
//  Typealias.swift
//  
//
//  Created by KimJunsoo on 1/2/25.
//

struct Pug {
    let name: String
}
typealias Grumble = [Pug] // Array<Pug>

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

public func runTypealias() {
    
    var pugs = [Pug]()// let pugs = Array<Pug>(), Pug의 배열 생성 함수
    var grumble = Grumble()

    let marty = Pug(name: "Marty")
    let wolfie = Pug(name: "Wolfie")
    let buddy = Pug(name: "Buddy")

    //pugs.append(contentsOf: [marty, wolfie, buddy])
    grumble.append(contentsOf: [marty, wolfie, buddy])
    print(grumble)

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
}
