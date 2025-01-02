import Foundation

//runOptional() // 옵티널
//runFunction() // 함수
//runClass() // 클래스
//runStruct() // 구조체
//runEnun() // 열거형
//runClosure() // 클로저
//runProtocol() // 프로토콜

protocol Payable {
    func calculateWages() -> Double
}

protocol TimeOffRequestable {
    func requestTimeOff(days: Int) -> Bool
}

func processEmployee(employee: Payable & TimeOffRequestable) {
    let wages = employee.calculateWages()
    let timeOffRequestResult = employee.requestTimeOff(days: 10)
}

protocol Container {
    associatedtype Item // 추후에 타입을 지정해서 사용을 해줘
    mutating func add(_ item: Item)
    var count: Int { get }
}

struct IntStack: Container {
    typealias Item = Int // 타입 지정 할게
    private var items: [Int] = []
    
    mutating func add(_ item: Int) { items.append(item) }
    var count: Int { items.count }
}

// 제너릭
protocol Describable {
    var description: String { get }
}

func printDecription<T: Describable>(_ item: T) {
    print(item.description)
} //printDecription("제너릭 디스크립션")

// 모듈화
protocol Runnable {
    func run()
}

protocol Swimmable {
    func swim()
}

protocol Flyable {
    func fly()
}

struct Bird: Flyable, Runnable {
    func fly() { print("Flying") }
    func run() { print("Running") }
}

struct Fish: Swimmable {
    func swim() { print("Swimming") }
}

struct Duck: Flyable, Runnable, Swimmable {
    func fly() { print("Flying") }
    func run() { print("Running") }
    func swim() { print("Swimming") }
}

let duck = Duck()
duck.fly()
duck.run()
duck.swim()
