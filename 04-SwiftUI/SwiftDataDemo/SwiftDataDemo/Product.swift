//
//  Product.swift
//  SwiftDataDemo
//
//  Created by KimJunsoo on 1/16/25.
//

import Foundation
import SwiftData

// @Model : 이 매크로로 지정한 클래스가 영구 저장 모델로 정의 되었음을 표시
// SwiftData가 모델 상태를 관리, 데이터 저장소와 상호작용을 가능하게 만듬
@Model
final class Product {
    var name: String?
    var quantity: String?
    
    init(name: String, quantity: String) {
        self.name = name
        self.quantity = quantity
    }
}
