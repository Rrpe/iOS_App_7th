//
//  SecondTabView.swift
//  HelloWorld
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct SecondTabView: View {
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text, initial: false) {
                print("onChange triggered \(text)")
            }
    }
}

#Preview {
    SecondTabView()
}
