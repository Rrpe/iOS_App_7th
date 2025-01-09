//
//  ContentView.swift
//  HelloWorld
//
//  Created by KimJunsoo on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        myLayout {
            Text("Sample Text")
            Text("Sample Text")
            Text("Sample Text")
        }
        HStack {
            Button(action: {
                myLayout = AnyLayout(HStackLayout())
            }) {
                Text("HStack")
            }
            Button(action: {
                myLayout = AnyLayout(VStackLayout())
            }) {
                Text("VStack")
            }
        }
        
        HStack {
            Image(systemName: "airplane")
            Text("Flight times:").layoutPriority(1) // 우선순위 부여
            Text("London")
        }.font(.largeTitle).lineLimit(1) // 글씨 크기로 인해 줄 바뀜을 제한
    } // body View
} // ContentView

#Preview {
    ContentView()
}
