import Foundation

//runOptional()
runFunction()

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

let person = Person.createDummyPerson()
print(person.fullName())

let person2 = Person(givenName: "Jane", familyName: "Doe")
print(person2.displayName)

let person3 = Person.createDummyPerson()
person3.country = "US"
print(person3.displayName)
print(person.displayName)

// final 사용시 상속 불가
final class Friend: Person {
    var whereWeMet: String?
    
    override var displayName: String {
        //
        return super.displayName + " - Where we met: \(whereWeMet ?? "Unknown")"
    }
}

let friend = Friend(givenName: "길동", familyName: "홍")
friend.whereWeMet = "런던"
print(friend.displayName)
