//
//  ScrollViewReaderExample.swift
//  PowerfulSwiftUI
//
//  Created by KimJunsoo on 4/3/25.
//

import SwiftUI

struct ScrollViewReaderExample: View {
    @State private var selectedId = 0
    var str1 = "Go to 25"
    var str2 = "Go to 50"
    var str3 = "Go to 75"
    
    var body: some View {
        VStack {
            HStack {
                Button(str1) {
                    withAnimation {
                        selectedId = 25
                    }
                }
                Button(str2) {
                    withAnimation {
                        selectedId = 50
                    }
                }
                Button(str3) {
                    withAnimation {
                        selectedId = 75
                    }
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    LazyVStack {
                        ForEach(0..<100) { id in
                            Text("Item \(id)")
                                .id(id)
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(id == selectedId ? Color.blue : Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                    }
                    .onChange(of: selectedId) { old, new in
                        /// proxy를 이용해 스크롤 위치를 변경합니다.
                        /// easeInOut 애니메이션을 사용하여 부드럽게 스크롤 합니다.
                        withAnimation(.easeInOut(duration: 1.0)) {
                            proxy.scrollTo(new, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderExample()
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
}
