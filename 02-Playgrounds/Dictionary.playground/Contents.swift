import Foundation

// struct(구조체)
struct PersonName {
    let givenName: String
    let familyName: String
}

enum Role: String {
    case captain = "Captain"
    case firstOfficer = "First Officer"
    case secondOfficer = "Second Officer"
    case chiefEngineer = "Chief Engineer"
    case councillor = "Councillor"
    case securityOfficer = "Security Officer"
    case chiefMedicalOfficer = "Chief Medical Officer"
}

enum CommunicationMethod {
    case phone
    case email
    case textMessage
    case fax
    case telepathy
    case subSpaceRelay
    case tachyons
}

class Person {
    let name: PersonName
    let preferredCommunicationMethod: CommunicationMethod
    
    // 생성자
    convenience init(givenName: String, familyName: String, commsMethod: CommunicationMethod) {
        let name = PersonName(givenName: givenName, familyName: familyName)
        self.init(name: name, commsMethod: commsMethod)
    }
    
    // 초기화
    init(name: PersonName, commsMethod: CommunicationMethod) {
        self.name = name
        preferredCommunicationMethod = commsMethod
    }
    
    var displayName: String {
        return "\(name.givenName) \(name.familyName)"
    }
}

// String Type키와 Person객체를 갖는 딕셔너리 생성
var crew: [Role : Person] = [:] //var crew = Dictionary<String, Person>()

crew[.captain] = Person(givenName: "Jean-Luc", familyName: "Picard", commsMethod: .phone)
crew[.firstOfficer] = Person(givenName: "William", familyName: "Riker", commsMethod: .email)
crew[.chiefEngineer] = Person(givenName: "Geordi", familyName: "LaForge", commsMethod: .textMessage)
crew[.secondOfficer] = Person(givenName: "Data", familyName: "Soong", commsMethod: .fax)
crew[.councillor] = Person(givenName: "Deanna", familyName: "Troi", commsMethod: .telepathy)
crew[.securityOfficer] = Person(givenName: "Tasha", familyName: "Yar", commsMethod: .subSpaceRelay)
crew[.chiefMedicalOfficer] = Person(givenName: "Beverly", familyName: "Crusher", commsMethod: .tachyons)

let roles = Array(crew.keys)
print("crew key: \(roles)")

let firstRole = roles.first!
let cmo = crew[firstRole]!
print("\(firstRole): \(cmo.displayName)")

print(crew[.securityOfficer]!.displayName)
crew[.securityOfficer] = Person(givenName: "Work", familyName: "Son of Mogh", commsMethod: .subSpaceRelay)
print(crew[.securityOfficer]!.displayName)

let intByName: [String: Int] = ["one": 1, "two": 2, "three": 3] // Dictionary<String, Int>

