//
//  ContentView.swift
//  ProgressViewDemo
//
//  Created by KimJunsoo on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 30.0
    
    var body: some View {
        VStack {
            ProgressView("Task Progress", value: progress, total: 100)
                .progressViewStyle(LinearProgressViewStyle())
            // macOS 에서만 작동
            ProgressView("Task Progress", value: progress, total: 100)
                .progressViewStyle(CircularProgressViewStyle())
            ProgressView("Working...")
            Slider(value: $progress, in: 1...100, step: 0.1)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
