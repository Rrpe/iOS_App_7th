import Foundation

class RecentList<T: CustomStringConvertible> {
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
recentlyCopiedList.add(recent: "Second")
recentlyCopiedList.add(recent: "Last")
var recentlyCopied = recentlyCopiedList.getAll()
print(recentlyCopied) // Last, Next, First

let recentTestInt = RecentList<Int>()
recentTestInt.add(recent: 1)
recentTestInt.add(recent: 2)
recentTestInt.add(recent: 3)
recentTestInt.add(recent: 4)
recentTestInt.add(recent: 5)
var recentTestInts = recentTestInt.getAll()
print(recentTestInts)


/// CustomStringConvertible : Swift 표준 라이브러리
/// print 함수에서 문자열 내에 객체를 삽입할 때 사용
/// CustomDebugStringConvertible : 디버깅에 특화된 DebugPrint() 쓸 때 사용함
class Person: CustomStringConvertible {
    var description: String {
        return "Person(\(name))"
    }
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let rod = Person(name: "Rod")
let john = Person(name: "John")
let freddy = Person(name: "Freddy")

let recentlyVisitedList = RecentList<Person>()
recentlyVisitedList.add(recent: rod)
recentlyVisitedList.add(recent: john)
recentlyVisitedList.add(recent: freddy)
var recentlyVisited = recentlyVisitedList.getAll()

for person in recentlyVisited {
    print(person)
}


// 제너릭 Hashable
func makeDuplicates<T,Key: Hashable>(of item: T, withKeys keys: Set<Key>) -> [Key: T] {
    var duplicates: [Key: T] = [:]
    
    for key in keys {
        duplicates[key] = item
    }
    
    return duplicates
}

let awards: Set<String> = ["Best Visual Effects",
                           "Best Cinematography",
                           "Best Original Score",
                           "Best Film Editing"]

let oscars2022 = makeDuplicates(of: "Dune", withKeys: awards)

print(oscars2022["Best Visual Effects"] ?? "")

// Protocol & Generics
// Transportlocation Porotocol
import CoreLocation

protocol TransportLocation {
    var location: CLLocation { get }
}

protocol TransportMethod {
    associatedtype CollectionPoint: TransportLocation
    
    var defaultCollectionPoint: CollectionPoint { get }
    var averageSpeedInKPH: Double { get }
}


enum TrainStation: String, TransportLocation {
    case BMS = "Bromley South"
    case VIC = "London Victoria"
    case RAI = "Rainhan (Kent)"
    case BTN = "Brighton (East Sussex)"
    
    var location: CLLocation {
            switch self {
            case .BMS:
                return CLLocation(latitude: 51.4000504, longitude: 0.0174237)
            case .VIC:
                return CLLocation(latitude: 51.4952103, longitude: -0.1438979)
            case .RAI:
                return CLLocation(latitude: 51.3663, longitude: 0.61137)
            case .BTN:
                return CLLocation(latitude: 50.829, longitude: -0.14125)
            }
        }
}

struct Train: TransportMethod {
    typealias CollectionPoint = TrainStation
    
    var defaultCollectionPoint: CollectionPoint {
        return TrainStation.BMS
    }
    var averageSpeedInKPH: Double { 100 }
}


class Journey<TransportType: TransportMethod> {
    let start: TransportType.CollectionPoint
    let end: TransportType.CollectionPoint
    let method: TransportType
    
    var distanceInKM: Double
    var durationInHours: Double
    
    init(start: TransportType.CollectionPoint,
         end: TransportType.CollectionPoint,
         method: TransportType) {
        self.start = start
        self.end = end
        self.method = method
        
        // 미터 단위의 거리 값 / 1000 => 킬로미터 단위로 변환
        distanceInKM = end.location.distance(from: start.location) / 1000
        durationInHours = distanceInKM / method.averageSpeedInKPH
    }
}

let trainJourney = Journey(start: TrainStation.BMS,
                          end: TrainStation.VIC,
                          method: Train())

let distanceByTrain = trainJourney.distanceInKM
let durationByTrain = trainJourney.durationInHours

print(distanceByTrain)
print(durationByTrain)

extension CLLocation: TransportLocation {
    var location: CLLocation { self }
}

enum Road: TransportMethod {
    typealias CollectionPoint = CLLocation
    
    case car
    case motorbike
    case van
    case hgv
    
    var defaultCollectionPoint: CLLocation {
            return CLLocation(latitude: 51.4000504, longitude: 0.0174237)
    }
    
    var averageSpeedInKPH: Double {
        switch self {
        case .car: return 60
        case .motorbike: return 70
        case .van: return 55
        case .hgv: return 50
        }
    }
    
    
}



