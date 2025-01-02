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
enum PoolBallType {
    case solid
    case stripe
    case black
}

func poolBallType(forNumber number: Int) ->  PoolBallType {
    if number < 8 {
        return .solid
    } else if number > 8 {
        return .stripe
    } else {
        return .black
    }
}

let two = poolBallType(forNumber: 2)
let eight = poolBallType(forNumber: 8)
let twoelve = poolBallType(forNumber: 12)

print(two)
