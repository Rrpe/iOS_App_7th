import Foundation

class RecentList<T> {
    var slot1: T?
    var slot2: T?
    var slot3: T?
    var slot4: T?
    var slot5: T?
    
    func add(recent: T) {
        // 각 슬롯을 1칸씩 아래로
        slot5 = slot4
        slot4 = slot3
        slot3 = slot2
        slot2 = slot1
        slot1 = recent
    }
    
    func getAll() -> [T] {
        var recent = [T]()
        if let slot1 = slot1 { recent.append(slot1) }
        if let slot2 = slot2 { recent.append(slot2) }
        if let slot3 = slot3 { recent.append(slot3) }
        if let slot4 = slot4 { recent.append(slot4) }
        if let slot5 = slot5 { recent.append(slot5) }
        return recent
    }
}

let recentlyCopiedList = RecentList<String>()
recentlyCopiedList.add(recent: "First")
recentlyCopiedList.add(recent: "Next")
recentlyCopiedList.add(recent: "Last")
var recentlyCopied = recentlyCopiedList.getAll()
print(recentlyCopied)

let recentTestInt = RecentList<Int>()
recentTestInt.add(recent: 1)
recentTestInt.add(recent: 2)
recentTestInt.add(recent: 3)
recentTestInt.add(recent: 4)
recentTestInt.add(recent: 5)
var recentTestInts = recentTestInt.getAll()
print(recentTestInts)

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
let rodrigo = Person(name: "Rodrigo")
let joseph = Person(name: "Joseph")
let josephine = Person(name: "Josephine")

let recentlyVisitedList = RecentList<Person>()
recentlyVisitedList.add(recent: rodrigo)
recentlyVisitedList.add(recent: joseph)
recentlyVisitedList.add(recent: josephine)
var recentlyVisitedPeople = recentlyVisitedList.getAll()
for i in recentlyVisitedPeople { print(i.name) }
