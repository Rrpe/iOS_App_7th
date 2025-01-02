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

// while문
enum CoinFlip: Int {
    case heads // = 0
    case tails // = 1
    
    static func flipCoin() -> CoinFlip {
        return CoinFlip(rawValue: Int.random(in: 0...1))!
    }
}

func howManyHeadsInARow() -> Int {
    var numberOfHeadsInARow = 0
    var currentFlip: CoinFlip = CoinFlip.flipCoin()
    while currentFlip == .heads {
        print("currentFlip.rawValue: \(currentFlip)") // 동전 나온 횟수
        numberOfHeadsInARow += 1
        currentFlip = CoinFlip.flipCoin()
    }
    return numberOfHeadsInARow
}

let noOfHeads = howManyHeadsInARow()
print(noOfHeads)

// try - catch -> do - catch
enum MealState {
    case initial
    case buyIngredients
    case propareIngredients
    case cook
    case plateUp
    case serve
}

enum MealError: Error {
    case canOnlyMoveToAppropriateState
}

class Meal {
    private(set) var state: MealState = .initial // 외부에서 참조 불가
    
    func change(to newState: MealState) throws {
        switch (state, newState) {
        case (.initial, .buyIngredients),
            (.buyIngredients, .propareIngredients),
            (.propareIngredients, .cook),
            (.cook, .plateUp),
            (.plateUp, .serve):
            state = newState
        default:
            throw MealError.canOnlyMoveToAppropriateState
        }
    }
    
    func buyIngredients() throws { try change(to: .buyIngredients) }
    func propareIngredients() throws { try change(to: .propareIngredients) }
    func cook() throws { try change(to: .cook) }
    func plateUp() throws { try change(to: .plateUp) }
    func serve() throws { try change(to: .serve) }
}
 
let dinner = Meal()

do {
//    try dinner.change(to: .buyIngredients)
//    try dinner.change(to: .propareIngredients)
//    try dinner.change(to: .cook)
//    try dinner.change(to: .plateUp)
//    try dinner.change(to: .serve)
    try dinner.buyIngredients()
    try dinner.propareIngredients()
    try dinner.cook()
    try dinner.plateUp()
    try dinner.serve()
    print("Raedy for Dinner!")
} catch let error {
    print(error)
}
