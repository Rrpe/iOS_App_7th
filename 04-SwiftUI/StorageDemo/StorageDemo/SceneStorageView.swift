//
//  SceneStorageView.swift
//  StorageDemo
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct SceneStorageView: View {
    @SceneStorage("mytext") private var editorText = "SceneStorage Text"
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}
#Preview {
    SceneStorageView()
}
