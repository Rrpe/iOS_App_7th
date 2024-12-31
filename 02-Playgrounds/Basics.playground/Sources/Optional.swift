//
//  Optional.swift
//  
//
//  Created by KimJunsoo on 12/31/24.
//
import Foundation

public func runOptional() {
    var dayOfTheWeek: String = "Monday"
    dayOfTheWeek = "Tuesday"
    print(dayOfTheWeek)
    dayOfTheWeek = "Wednesday"
    print(dayOfTheWeek)
    //dayOfTheWeek = nil // 변수에 타입이 지정된 경우 nil(null)을 넣을 수 없다.
    dayOfTheWeek = ""

    var numberOfFingersHeldUpByFinn: Int?
    numberOfFingersHeldUpByFinn = nil
    print(numberOfFingersHeldUpByFinn ?? "Unknwon")

    numberOfFingersHeldUpByFinn = 3
    print(numberOfFingersHeldUpByFinn ?? "Unknwon")

    // 강제 언래핑
    //let lastNumberOfFingersHeldUpByFinn: Int = numberOfFingersHeldUpByFinn!
    //print(lastNumberOfFingersHeldUpByFinn)

//    numberOfFingersHeldUpByFinn = nil
    // 조건부 언래핑
    if let numberOfFingerHeld = numberOfFingersHeldUpByFinn {
        print(numberOfFingerHeld) // 값이 nil이 아니면 실행
    } else {
        print("moluu")
    } // if let numberOfFingerHeld은 if문 안에서만

    guard let numberOfFingerHeld = numberOfFingersHeldUpByFinn else {
    //    값이 없으면 실행
        print("몰??루")
        return
    } // guard let numberOfFingerHeld는 밖에서 사용 가능
    print(numberOfFingerHeld)
}
