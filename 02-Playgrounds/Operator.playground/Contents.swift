
// 이진수에 대한 상수 정의
let zero: Int   = 0b000 // 0
let one: Int    = 0b001 // 1
let two: Int    = 0b010 // 2
let three: Int  = 0b011 // 3
let four: Int   = 0b100 // 4
let five: Int   = 0b101 // 5
let six: Int    = 0b110 // 6
let seven: Int  = 0b111 // 7

// 다른 비트 값을 이용해 옵션을 생성
//let phone: Int          = 0b00000001 // 1
//let tablet: Int         = 0b00000010 // 2
//let watch: Int          = 0b00000100 // 4
//let laptop: Int         = 0b00001000 // 8
//let desktop: Int        = 0b00010000 // 16
//let tv: Int             = 0b00100000 // 32
//let brainImplant: Int   = 0b01000000 // 64
//let quantumComputer: Int = 0b10000000 // 128

// 비트 연산자
let phone: Int = 1 << 0
let tablet: Int = 1 << 1
let watch: Int = 1 << 2
let laptop: Int = 1 << 3
let desktop: Int = 1 << 4
let tv: Int = 1 << 5
let brainImplant: Int = 1 << 6
let quantumComputer: Int = 1 << 7

//var supportedDevices: Int = phone + tablet + tv

//   0 0 0 1 0 0 1 1 = supportedDevices
// & 0 0 0 0 0 0 1 0 = tablet (device)
// ------------------
//   0 0 0 0 0 0 1 0 = device


//@MainActor
//func isSupported(device: Int) -> Bool {
//    let bitWiseAnd: Int = supportedDevices & device
//    let containsDevice = bitWiseAnd == device
//    return containsDevice
//}

// phone + tablet + tv calculation:
//   0 0 0 0 0 0 0 1 = phone
// + 0 0 0 0 0 0 1 0 = tablet
// + 0 0 0 0 0 1 0 0 = tv
// ------------------
//   0 0 0 0 0 1 1 1 = deviceThatSupportUIKit
let deviceThatSupportUIKit = phone + tablet + tv

// desktop + tv calculation:
//   0 0 0 0 1 0 0 0 = desktop
// + 0 0 0 0 0 1 0 0 = tv
// ------------------
//   0 0 0 0 1 1 0 0 = statinaryDevice
let statinaryDevice = desktop + tv

// deviceThatSupportUIKit | statinaryDevice calculation:
//   0 0 0 0 0 1 1 1 = deviceThatSupportUIKit
// | 0 0 0 0 1 1 0 0 = statinaryDevice
// ------------------
//   0 0 0 0 1 1 1 1 = stationaryOrUIKietDevices
//let stationaryOrUIKietDevices = deviceThatSupportUIKit | statinaryDevice

// Verification of union operation:
//   0 0 0 0 1 1 1 1 = stationaryOrUIKietDevices
// = 0 0 0 0 1 1 1 1 = (phone + tablet + tv + desktop)
// ------------------
//   true              = orIsUnion
//let orIsUnion = stationaryOrUIKietDevices == (phone + tablet + tv + desktop)
//print(orIsUnion)

// OptionSet
struct Devices: OptionSet {
    var rawValue: Int
    
    static let phone = Devices(rawValue: 1 << 0)
    static let tablet = Devices(rawValue: 1 << 1)
    static let watch = Devices(rawValue: 1 << 2)
    static let laptop = Devices(rawValue: 1 << 3)
    static let desktop = Devices(rawValue: 1 << 4)
    static let tv = Devices(rawValue: 1 << 5)
    static let brainImplant = Devices(rawValue: 1 << 6)
    static let quantumComputer = Devices(rawValue: 1 << 7)
    
    static let none: Devices = []
    static let all: Devices = [.phone, .tablet, .watch, .laptop, .desktop, .tv, .brainImplant, .quantumComputer]
    static let stationary: Devices = [.desktop, .tv]
    static let supportedUIKit: Devices = [.phone, .tablet, .tv]
}

let supportedDevices: Devices = [.phone, .tablet, .watch, .tv]
print(supportedDevices.rawValue)

let phoneIsSupported = supportedDevices.contains(.phone)

// Union / OR
let stationaryOrUIKitDevices = Devices.supportedUIKit.union(Devices.stationary)

// Intersection / AND
let stationaryAndUIKitDevices = Devices.supportedUIKit.intersection(Devices.stationary)

// 사용자가 만드는 커스텀 연산자
infix operator ->>

func ->> (lhs: String, rhs: String) -> String {
    var combine = rhs
    combine.append(lhs)
    return combine
}

//func >>> (lhs: String, rhs: [String]) -> [String] {
//    var combined = rhs
//    combined.append(lhs)
//    return combined
//}
//
//func >>> (lhs: [String], rhs: [String]) -> [String] {
//    var combined = rhs
//    combined.append(contentsOf: lhs)
//    return combined
//}

func ->> <Element>(lhs: Element, rhs: Array<Element> ) -> Array<Element> {
    var combined = rhs
    combined.append(lhs)
    return combined
}

func ->> <Element>(lhs: Array<Element>, rhs: Array<Element> ) -> Array<Element> {
    var combined = rhs
    combined.append(contentsOf: lhs)
    return combined
}

let appendedString = "Two" ->> "One"
print(appendedString)

let appendStringToArray = "Three" ->> ["One", "Two"]
print(appendStringToArray)

let appendedArray = ["Three", "Four"] ->> ["One", "Two"]
print(appendedArray)

let appendIntToArray = 1 ->> [3, 4]
print(appendIntToArray)
