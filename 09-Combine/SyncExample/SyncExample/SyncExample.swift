//
//  syncExample.swift
//  SyncExample
//
//  Created by KimJunsoo on 4/10/25.
//

import Foundation

// 고객 메시지 출력 함수
public func customerSays(_ message: String) {
    print("[Customer] \(message)")
}

// 샌드위치 제작자 메시지 출력 함수
public func sandwichMakerSays(_ message: String, waitFor time: UInt32 = 0) {
    print("[Sandwich maker] \(message)")
    if time > 0 {
        print("                 ... this will take \(time)s")
        sleep(time)
    }
}

// 샌드위치 만들기 함수
func makeSandwich(bread: String, ingredients: [String], condiments: [String]) -> String {
    sandwichMakerSays("Prepearing your sandwich...")
    let toasted = toastBread(bread)
    let sliced = slice(ingredients)
    sandwichMakerSays("Spreading \(condiments.joined(separator: ", and ")) on \(toasted)")
    sandwichMakerSays("Layering \(sliced.joined(separator: ", "))")
    sandwichMakerSays("Putting lettuce on top")
    sandwichMakerSays("Putting another slice of bread on top")
    return "\(ingredients.joined(separator: ", ")), \(condiments.joined(separator: ", ")) on \(toasted)"
}

// 빵을 굽는 함수
func toastBread(_ bread: String) -> String {
    sandwichMakerSays("Toasting the bread... Standing by...", waitFor: 5)
    return "Crispy \(bread)"
}

// 재료를 자르는 함수
func slice(_ ingredients: [String]) -> [String] {
    let result = ingredients.map { ingredient in
        sandwichMakerSays("Slicing \(ingredient)", waitFor: 1)
        return "sliced \(ingredient)"
    }
    return result
}

