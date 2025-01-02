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
//runIfelse() // If - else

enum CompassPoint: String {
    case north
    case south
    case east
    case west
}

func lookTowards(_ direction: CompassPoint) {
    switch direction {
    case .north:
        print("북쪽으로는 구불구불한 길이 있습니다")
    case .south:
        print("남쪽에는 프랜싱 포니 선술집이 있습니다")
    case .east:
        print("동쪽에는 대장간이 있습니다")
    case .west:
        print("서쪽에는 마을 광장이 있습니다")
    }
}

lookTowards(.south)

enum Item {
    case key
    case lockedDoor
    case openDoor
    case bluntKnife
    case sharpeningStone
    case sharpKnife
}

func combine(_ firstItem: Item, with secondItem: Item) -> Item? { // 튜플 Tuple
    switch (firstItem, secondItem) {
    case (.key, .lockedDoor):
        print("문을 열었습니다!")
        return .openDoor
    case (.bluntKnife, .sharpeningStone):
        print("칼이 날카로워졌습니다.")
        return .sharpKnife
    default:
        print("'\(firstItem)'과 '\(secondItem)'은 결합할 수 없습니다")
        return nil
    }
}

let door = combine(.key, with: .lockedDoor)
let oilAndWater = combine(.bluntKnife, with: .lockedDoor)

print("---------------------------------------------")
// for문
let ledZeppelin = ["Robert", "Jimmy", "John", "John Paul"]

for musician in ledZeppelin {
    print(musician)
}

for value in 1...12 {
    print("5 x \(value) = \(value * 5)")
}

//let zeppelinByInstrument: [String: [String]] = [ "guitar": ["Robert", "Jimmy", "John"], "drums": ["John Paul"] ]
let zeppelinByInstrument = ["vocals": "Robert", "lead guitar": "Jimmy", "drums": "John", "bass guitar": "John Paul"]

for (key, value) in zeppelinByInstrument {
    print("\(value)가 \(key)를 연주합니다.")
}

// forEach문
//ledZeppelin.forEach { musician in print(musician) }
ledZeppelin.forEach { print($0) }
zeppelinByInstrument.forEach { (key, value) in print("\(value)가 \(key)를 연주합니다.") }
