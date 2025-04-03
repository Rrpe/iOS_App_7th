//
//  ContentView.swift
//  PowerfulSwiftUI
//
//  Created by KimJunsoo on 4/3/25.
//

import SwiftUI

struct LazyGridExample: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: columns, spacing: 20) {
                ForEach(0..<50) { index in
                    Text("Item \(index)")
                        .frame(maxHeight: .infinity)
                        .frame(width: 150)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

struct ContentView: View {
    var body: some View {
        LazyGridExample()
    }
}

#Preview {
    ContentView()
}
