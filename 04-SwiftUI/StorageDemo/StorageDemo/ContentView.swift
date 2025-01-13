//
//  ContentView.swift
//  StorageDemo
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    // scene 관련된 데이터를 저장하고 관리하는데 사용
    @SceneStorage("city") var city: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, World!")
            TextEditor(text: $city)
                .padding()
                .border(Color.blue)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
