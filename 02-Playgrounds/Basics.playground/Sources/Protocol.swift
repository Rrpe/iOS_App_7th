//
//  Protocol.swift
//  
//
//  Created by KimJunsoo on 1/2/25.
//

import Foundation

protocol Describable {
    var description: String { get }
}

fileprivate struct Person: Describable {
    let name: String
    let age: Int
    
    var description: String {
        return "Person: \(name), \(age)"
    }
}

protocol Movable {
    func move(to poitn: CGPoint)
}

class Car: Movable {
    var position: CGPoint = CGPoint(x: 0, y: 0)
    
    func move(to point: CGPoint) {
        position = point
        print("Car move to \(point)")
    }
}

// required
protocol Named {
    init(name: String)
    
    func displayName() -> String
}

extension Named {
    func printDescripton() {
        print(displayName())
    }
}

extension String {
    func makeUpperCase() -> String {
        return uppercased()
    }
}

fileprivate class Person2: Named {
    func displayName() -> String {
        return "Person2: \(name)"
    }
    
    let name: String
    
    required init(name: String) {
        self.name = name
    }
}

fileprivate class Friend: Person2 {
    let age: Int
    
    required init(name: String) {
        fatalError("init(name:) has not been implemented")
    }
}

fileprivate struct Point: Named {
    func displayName() -> String {
        return "Point: \(name)"
    }
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

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

public func runProtocol() {
    let person = Person(name: "Jung", age: 20)
    print(person.description)

    let car = Car()
    car.move(to: CGPoint(x: 10, y: 20))
    print(car.position)

    let person3 = Person2(name: "Jung")
    person3.printDescripton()

    print("car".makeUpperCase())

    let duck = Duck()
    duck.fly()
    duck.run()
    duck.swim()

}
