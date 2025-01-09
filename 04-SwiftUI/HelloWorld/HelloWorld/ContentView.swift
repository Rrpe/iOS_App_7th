//
//  ContentView.swift
//  HelloWorld
//
//  Created by KimJunsoo on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Hello World, how are you")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 2,
                           height: (geometry.size.height / 4) * 3)
                    .border(Color.red, width: 1)
                Text("Goodbye World")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 3,
                           height: geometry.size.height / 4)
                    .border(Color.blue, width: 1)
            }
        }
    } // body View
} // ContentView

#Preview {
    ContentView()
}
