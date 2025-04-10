//
//  main.swift
//  SyncExample
//
//  Created by KimJunsoo on 4/10/25.
//

import Foundation

// 메인 프로그램은 다음과 같습니다
sandwichMakerSays("안녕하세요! 싱크 카페입니다. 고객님의 주문을 순차적으로 처리합니다.")
sandwichMakerSays("주문 하세요.")
// 우리는 샌드위치를 만드는데 걸린 시간을 측정하기 위해 ContinuousClock을 사용하고 있습니다.
let clock = ContinuousClock()
let time = clock.measure {
    let sandwich = makeSandwich(bread: "호밀", ingredients: ["피클", "토마토"], condiments: ["마요네즈", "머스타드"])
    customerSays("Hmmm.... this looks like a delicious \(sandwich) sandwich!")
}
// 이 작업은 약 7초 정도 걸립니다 (토스트에 5초, 각 재료를 자르는 데 1초씩)
print("Making this sandwich took \(time)")
