//
//  FirstTabView.swift
//  HelloWorld
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        Text("View One")
            .onAppear(perform: { // 뷰 호출 시
                print("onAppear triggered")
            })
            .onDisappear(perform: { // 뷰 종료 시
                print("onDisappear triggered")
            })
    }
}

#Preview {
    FirstTabView()
}
