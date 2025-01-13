//
//  StartView.swift
//  RPG_Demo
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct StartView: View {
    @StateObject private var viewModel = GamePlayModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("RPG 게임")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Button(action: {
                    // 게임 시작 로직
                }) {
                    NavigationLink(destination: GamePlayView(viewModel: viewModel)) {
                        Text("게임 시작")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                Button(action: {
                    // 이어하기 로직
                }) {
                    Text("이어하기")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // 게임 종료 로직
                }) {
                    Text("게임 종료")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("")
        }
    }
}
