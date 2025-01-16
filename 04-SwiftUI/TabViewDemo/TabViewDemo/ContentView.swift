//
//  ContentView.swift
//  TabViewDemo
//
//  Created by KimJunsoo on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int = 1
    
    init() {
            // UIPageControl의 외형 설정
            UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.blue
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.red
        }
    
    var body: some View {
        //selection 값에 따라 화면 전환_ 시작 탭 정할 수도 있음.(현재는 0번)
        TabView(selection: $selection) {
            Text("First Content View")
                // 하단에 생성)탭바에 있는 아이콘
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Screen One")
                }
                .tag(0)
                .badge("!")
            Text("Second Content View")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Screen Two")
                }
                .tag(1)
            Text("Third Content View")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Screen Three")
                }
                .tag(2)
                .badge(10) // 알림 추가
        }
        .font(.largeTitle)
        .border(Color.gray)
        .foregroundStyle(.white)
        .background(Color.black)
        .frame(height: 400)
        // tabItem인디게이터화 및 뷰(화면)슬라이드 가능
        // 앱 상단 광고(?) 페이지에서 자주 본듯함
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .padding()
        
        HStack {
            Button("1") {
                selection = 0
            }
            .disabled(selection == 0)
            Button("2") {
                selection = 1
            }
            .disabled(selection == 1)
            Button("3") {
                selection = 2
            }
            .disabled(selection == 2)
        }
        /*HStack(spacing: 10) {
            ForEach(0..<3) { index in
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(selection == index ? .blue : .red)
            }
        }
        .padding()*/
    }
}

#Preview {
    ContentView()
}
