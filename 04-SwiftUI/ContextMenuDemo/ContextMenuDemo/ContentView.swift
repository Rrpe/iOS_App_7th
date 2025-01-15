//
//  ContentView.swift
//  ContextMenuDemo
//
//  Created by KimJunsoo on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var foregroundColor: Color = .yellow
    @State private var backgroundColor: Color = .black
    
    var body: some View {
        
        Text("Hello, World!")
            .font(.largeTitle)
            .padding()
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
        // 텍스트를 길게 누르면 contextMenu가 나타남
            .contextMenu {
                Button(action: {
                    self.foregroundColor = .black
                    self.backgroundColor = .white
                }, label: {
                    Text("Normal Colors")
                    Image(systemName: "paintbrush")
                })
                Button(action: {
                    self.foregroundColor = .white
                    self.backgroundColor = .black
                }, label: {
                    Text("Inverted Colors")
                    Image(systemName: "paintbrush.fill")
                })
            }
    }
}

#Preview {
    ContentView()
}
