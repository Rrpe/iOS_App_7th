//
//  main.swift
//  XCTestHW
//
//  Created by KimJunsoo on 4/14/25.
//

import Foundation

// 타겟 함수
func 피즈버즈(_ number: Int) -> String {
    if number % 3 == 0 && number % 5 == 0 {
        return "fizz-buzz"
    }
    if number % 3 == 0 {
        return "fizz"
    }
    if number % 5 == 0 {
        return "buzz"
    }
    return "\(number)"
}

// 테스트 함수
func 테스트피즈버즈() {
    print("FizzBuzz 테스트 시작")
    print("FizzBuzz(1): \(피즈버즈(1) == "1" ? "✅" : "❌")")
    print("FizzBuzz(2): \(피즈버즈(2) == "2" ? "✅" : "❌")")
    print("FizzBuzz(3): \(피즈버즈(3) == "fizz" ? "✅" : "❌")")
    print("FizzBuzz(5): \(피즈버즈(5) == "buzz" ? "✅" : "❌")")
    print("FizzBuzz(15): \(피즈버즈(15) == "fizz-buzz" ? "✅" : "❌")")
    print("FizzBuzz 테스트 완료")
}

테스트피즈버즈()
