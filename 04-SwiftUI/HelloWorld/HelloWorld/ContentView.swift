//
//  ContentView.swift
//  HelloWorld
//
//  Created by KimJunsoo on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            ZStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            // 복잡한 중첩 레이아웃 예시
            Text("Financial Results").font(.title)
            HStack {
                Text("Q1 Sales").font(.headline)
                VStack {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                VStack {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
            }
            // 정렬, 여백
            Text("Financial Results").font(.title).padding(10)
            HStack(alignment: .top) {
                Text("Qi Sales").font(.headline)
                Spacer()
                // alignment: .trailing, .center, .leading
                VStack(alignment: .trailing) {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
            }
            
        } // VStack
    }
}

#Preview {
    ContentView()
}
