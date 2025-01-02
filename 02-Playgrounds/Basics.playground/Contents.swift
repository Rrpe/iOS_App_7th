import Foundation

//runOptional() // 옵티널
//runFunction() // 함수
//runClass() // 클래스
//runStruct() // 구조체
//runEnun() // 열거형
//runClosure() // 클로저
//runProtocol() // 프로토콜
//runTypealias() // 타입일리아스
//runPropertyObserver() // 프로토콜 버저버

// 제어 흐름
enum PoolBallType: String {
    case solid
    case stripe
    case black
}

func poolBallType(forNumber number: Int) ->  PoolBallType? {
    if number < 8 && number > 0 {
        return .solid
    } else if number > 8 && number < 16 {
        return .stripe
    } else if number == 8 {
        return .black
    } else {
        return nil
    }
}

func printBallDetails(ofNumber number: Int) {
    let possibleBallType = poolBallType(forNumber: number)
    if let ballType = possibleBallType {
        print("\(number) - \(ballType.rawValue)")
    } else {
        print("\(number) is not a valid pool ball number")
    }
}

let two = poolBallType(forNumber: 2)
let eight = poolBallType(forNumber: 8)
let twoelve = poolBallType(forNumber: 12)

let zero = poolBallType(forNumber: 0)
let sixteen = poolBallType(forNumber: 16)

printBallDetails(ofNumber: 2)
printBallDetails(ofNumber: 8)
printBallDetails(ofNumber: 12)
printBallDetails(ofNumber: 0)
printBallDetails(ofNumber: 16)
