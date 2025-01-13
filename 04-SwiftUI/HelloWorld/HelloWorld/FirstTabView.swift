//
//  FirstTabView.swift
//  HelloWorld
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct FirstTabView: View {
    @State var title = "View One"
    
    var body: some View {
        Text(title)
            .onAppear(perform: { // 뷰 호출 시
                print("onAppear triggered")
            })
            .onDisappear(perform: { // 뷰 종료 시
                print("onDisappear triggered")
            })
            .task {
                title = await changeTitle()
            }
    }
    
    func changeTitle() async -> String {
        do {
            try await Task.sleep(nanoseconds: 5_000_000_000)
        } catch {
            print("Error: \(error)")
            return "Error occurred"
        }
        return "Async task completed"
    }
    
}

#Preview {
    FirstTabView()
}
