//
//  ContentView.swift
//  SwiftUIDemoAPp
//
//  Created by KimJunsoo on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0.0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        VStack {
            
            VStack {
                Spacer()
                
                // 텍스트 표시 및 애니메이션(회전) 추가
                Text("Hello, world!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(rotation))
                    .animation(.easeInOut(duration: 1), value: rotation)
                    .foregroundStyle(colors[colorIndex])
                Spacer()
                Divider() // 구분선
                
                // 슬라이더, 텍스트 회전 각도 설정
                Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
                
                TextField("Enter text here", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // 피커, 색상 선택
                Picker(selection: $colorIndex, label: Text("Color")) {
                    ForEach(0 ..< colornames.count, id: \.self) {
                        Text(colornames[$0])
                            .foregroundStyle(colors[$0])
                    }
                }.pickerStyle(.wheel)
                .padding()
            }
        
        } // VStack
    } // body View
} // Content View

#Preview {
    ContentView()
}
