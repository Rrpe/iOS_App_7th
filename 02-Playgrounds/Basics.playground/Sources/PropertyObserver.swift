//
//  PropertyObserver.swift
//  
//
//  Created by KimJunsoo on 1/2/25.
//
import Foundation


// 프로퍼티 옵저버
class Manager {
    var currentUserName: String = "" {
        willSet { // newValue (기본 매개변수) 생략 가능
            print("기존 '\(currentUserName)'이(가) '\(newValue)'으로 변경 됩니다.")
        }
        didSet { // oldValue 파라미터 생략 가능 = 기본 매개변수
            print("'\(currentUserName)'이(가) '\(oldValue)'으로 변경되었습니다.")
        }
    }
    
    init(_ currentUserName: String) {
        self.currentUserName = currentUserName
    }
    
    func changeManage(_ name: String) {
        self.currentUserName = name
    }
}

public func runPropertyObserver() {
    let manager = Manager("김준수")
    manager.currentUserName = "란페르"
}
