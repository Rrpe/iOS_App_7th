//
//  ContentView.swift
//  StorageDemo
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    // scene 관련된 데이터를 저장하고 관리하는데 사용
    // 시스템이 데이터를 언제까지 유지할 지 모름!
    @SceneStorage("city") var city: String = ""
    @AppStorage("mystore") var mytext: String = ""
    
    var body: some View {
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
    
}

#Preview {
    ContentView()
}
