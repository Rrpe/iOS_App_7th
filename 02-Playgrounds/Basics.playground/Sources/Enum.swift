//
//  Enum.swift
//  
//
//  Created by KimJunsoo on 12/31/24.
//

/// 열거형
/// - 대문자로 시작하는 것이 관례
/// - case 는 값
/// - 연관 값을 이용하면 추가정보를 저장할 수 있다.
/// - 열거형 값을 원시타입(Int, Float, Bool, Double, String)의 값으로 지정할 수 있다.
/// - 원시타입 값 확인 방법: .rawValue
enum CompassDirection {
    case north
    case south
    case east
    case west
}

// 연관 열거형
enum Barcode {
    case qrCode(String)
    case barCode(String)
    case upc(Int, Int, Int, Int)
}


// rawValue 원시 값
enum Title: String {
    case mr = "Mr." // rawValue: "Mr."
    case ms = "Ms."
    case mrs = "Mrs."
    case dr = "Dr."
    case other
}

enum Gender: Int {
    case male = 1
    case female = 2
    case other
}

// self
enum Planet: String {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    func surfaceGravity() -> Double {
        switch self {
        case .mercury: return 0.37
        case .venus: return 0.91
        case .earth: return 1.0
        case .mars: return 0.38
        case .jupiter: return 2.6
        case .saturn: return 1.1
        case .uranus: return 0.8
        case .neptune: return 1.1
        }
    }
}

public func runEnun() {
    // 타입추론
    //let otherDirection = CompassDirection.east
//    let otherDirection: CompassDirection = .east

    // enum 이름을 생략 할 수 있다.
    let direction: CompassDirection = .north

    switch direction {
        case .north: print("북")
        case .south: print("남")
        case .east: print("동")
        case .west: print("서")
    }
    
    let productBarcode: Barcode = .qrCode("Hello")
//    let productBarcode2: Barcode = .barCode("World")
//    let productBarcode3: Barcode = .upc(123456789, 123456789, 123456789, 123456789)
    
    print(productBarcode)

    // rawValue 원시 값
    let title: Title = .mr
    print(title.rawValue)

    let gender: Gender = .other
    print(gender.rawValue)

    // self
    let earth = Planet.earth
    print(earth.surfaceGravity())

}
