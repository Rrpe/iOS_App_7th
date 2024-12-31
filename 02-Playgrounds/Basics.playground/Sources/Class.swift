//
//  Class.swift
//  
//
//  Created by KimJunsoo on 12/31/24.
//

class Person {
    // 멤버변수 - 프로퍼티
    let givenName: String
    let middleName: String?
    let familyName: String
    var country: String = "Korea"
    
    init(givenName: String, middleName: String? = nil, familyName: String) {
        self.givenName = givenName
        self.middleName = middleName
        self.familyName = familyName
    }
    
    var displayName: String {
        return "\(fullName()) - Location: \(country)"
    }
    
    func fullName() -> String {
        var fullName: String = ""
        if let middleName {
            fullName += middleName + " "
        }
        fullName += givenName + " " + familyName
        return fullName
    }
    
    static func createDummyPerson() -> Person {
        return Person(givenName: "John", familyName: "Snow")
    }
    
    // 싱글톤 패턴
}

// final 사용시 상속 불가
final class Friend: Person {
    var whereWeMet: String?
    
    override var displayName: String {
        //
        return super.displayName + " - Where we met: \(whereWeMet ?? "Unknown")"
    }
}

final class Family: Person {
    let relationship: String
    
    init(givenName: String, middleName: String? , familyName: String = "Barker", relationship: String) {
        self.relationship = relationship
        super.init(givenName: givenName, middleName: middleName , familyName: familyName)
    }
    
    override var displayName: String {
        return super.displayName + " - Relationship: \(relationship)"
    }
}


public func runClass() {
    let person = Person.createDummyPerson()
    print(person.fullName())

    let person2 = Person(givenName: "Jane", familyName: "Doe")
    print(person2.displayName)

    let person3 = Person.createDummyPerson()
    person3.country = "US"
    print(person3.displayName)
    print(person.displayName)

    let friend = Friend(givenName: "길동", familyName: "홍")
    friend.whereWeMet = "런던"
    print(friend.displayName)

    print("-----------------------------------------------------")

    let steve = Person(givenName: "Steve", middleName: "Paul", familyName: "Jobs")
    let sam = Friend(givenName: "Sam", middleName: "Now", familyName: "Rowley")
    sam.whereWeMet = "Work together at Jaguar Land Rover"
    let maddie = Family(givenName: "Maddie", middleName: "Rose", relationship: "Daughter")
    let mark = Family(givenName: "Mark", middleName: "David", familyName: "Pendlebury" , relationship: "Brother-In-Law")
    mark.country = "USA"

    print(steve.displayName)
    print(sam.displayName)
    print(maddie.displayName)
    print(mark.displayName)
}
