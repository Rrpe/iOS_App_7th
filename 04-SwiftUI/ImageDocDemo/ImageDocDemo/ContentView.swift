//
//  ContentView.swift
//  ImageDocDemo
//
//  Created by KimJunsoo on 1/16/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: ImageDocDemoDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(ImageDocDemoDocument()))
}
