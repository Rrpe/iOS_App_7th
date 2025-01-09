//
//  ContentView.swift
//  HelloWorld
//
//  Created by KimJunsoo on 1/8/25.
//

import SwiftUI

struct MyVStack<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}

// 커스텀 레이블 스타일 (레이아웃)
struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.icon.padding(5)
            configuration.title
        }
    }
}

struct ContentView: View {
    // 상태를 관리하는 프로퍼티
    @State private var count = 0
    
    var body: some View {
        MyVStack {
            Text("Text 1")
            Text("Text 2")
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
            Button(action: {
                print("click")
            })
            {
                Label("Welcome to SwiftUI", systemImage: "person.circle.fill")
            }
            Label(title: {
                Text("Welcome to SwiftUI").font(.largeTitle)
            },
                  icon: {
                Circle().fill(Color.blue).frame(width: 25,  height: 25)
            })
            .labelStyle(.titleAndIcon)
            
            Label("수직 레이블", systemImage: "moon.fill").labelStyle(VerticalLabelStyle())
        }
    }
}

#Preview {
    ContentView()
}
