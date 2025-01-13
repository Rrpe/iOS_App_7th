//
//  AppStorageView.swift
//  StorageDemo
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("mytext") var editorText: String = "AppStorage Text"
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}
#Preview {
    AppStorageView()
}
