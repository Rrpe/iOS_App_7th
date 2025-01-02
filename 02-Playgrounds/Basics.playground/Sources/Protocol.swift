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

public func runProtocol() {
    let person = Person(name: "Jung", age: 20)
    print(person.description)



    let car = Car()
    car.move(to: CGPoint(x: 10, y: 20))
    print(car.position)



    let person3 = Person2(name: "Jung")
    person3.printDescripton()

    print("car".makeUpperCase())

}
