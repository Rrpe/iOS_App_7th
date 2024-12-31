//
//  Function.swift
//  
//
//  Created by KimJunsoo on 12/31/24.
//

// 매개변수레이블 변수이름: 타입
func fullName(이름 givenName: String = "길동",
              중간이름 middleName: String? = nil,
              성 familyName: String = "홍") -> String {
    var fullName = familyName
    if let middleName {
        fullName += " \(middleName)"
    }
    fullName += " \(givenName)"
    return fullName
}

// swift는 타입을 구분해주기 때문에 이렇게 해도 됨
func combine(_ string1: String, _ string2: String) -> String {
    return "\(string1) \(string2)" // 문자열 보간법
}

func combine(_ int1: Int, _ int2: Int) -> Int {
    return int1 + int2
}

func combine(_ int1: Int, _ string1: String) -> String {
    return "\(int1) \(string1)"
}

public func runFunction() {
    let myFullName = fullName(이름: "준수", 성: "김")
    print(myFullName)

    let myFullName2 = fullName()
    print(myFullName2)

    let combineString = combine("Hello", "World")
    print(combineString)

    let combineInt = combine(1, 2)
    print(combineInt)

    let combineMix = combine(1, "Hello")
    print(combineMix)

}
