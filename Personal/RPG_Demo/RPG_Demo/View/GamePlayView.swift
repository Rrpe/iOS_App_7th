//
//  GamePlayerView.swift
//  RPG_Demo
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct GamePlayView: View {
    @ObservedObject var viewModel: GamePlayModel
    
    var body: some View {
        VStack(spacing: 20) {
            // 몬스터 상태
            VStack {
                Text(viewModel.monster.name)
                    .font(.headline)
                Text("HP: \(viewModel.monster.hp)")
                Text("공격력: \(viewModel.monster.atk)")
                Text("방어력: \(viewModel.monster.def)")
            }
            .padding()
            .background(Color.red.opacity(0.2))
            .cornerRadius(10)
            
            // 플레이어 상태
            VStack {
                Text(viewModel.player.name)
                    .font(.headline)
                Text("HP: \(viewModel.player.hp)")
                Text("공격력: \(viewModel.player.atk)")
                Text("방어력: \(viewModel.player.def)")
            }
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(10)

            // 전투 로그
            ScrollView {
                ForEach(viewModel.log.suffix(5), id: \.self) { logEntry in
                    Text(logEntry)
                        .font(.footnote)
                        .padding(4)
                }
            }
            .frame(height: 200)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)

            // 전투 및 회복 버튼
            HStack(spacing: 20) {
                Button(action: {
                    // 공격 로직
                    viewModel.playerAttack()
                }) {
                    Text("공격")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    // 회복 로직
                }) {
                    Text("회복")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("게임 플레이")
    }
}
