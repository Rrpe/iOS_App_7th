//
//  ContentView.swift
//  HelloWorld
//
//  Created by KimJunsoo on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Clear World")
            .font(.largeTitle)
//            .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 100,
//                   alignment: .center)
            .frame(minWidth: 100, maxWidth: .infinity,
                   minHeight: 100, maxHeight: .infinity,
                   alignment: .center)
            .border(Color.red, width: 10)
            .ignoresSafeArea(.all)
//            .frame(width: 300, height: 100, alignment: .center)
    } // body View
} // ContentView

#Preview {
    ContentView()
}
