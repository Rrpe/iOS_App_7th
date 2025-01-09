//
//  ContentView.swift
//  HelloWorld
//
//  Created by KimJunsoo on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 수직 배열 레이아웃
        VStack {
                Text("Text1")
                Text("Text2")
                Text("Text3")
            HStack {
                Text("Text4")
                Text("Text5")
                Text("Hello, ") + Text("World!")
            }
            Text("Text6")
            Text("Hello, ") + Text("World!")
        }
    }
}

#Preview {
    ContentView()
}
