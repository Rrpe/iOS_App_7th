//
//  Character.swift
//  RPG_Demo
//
//  Created by KimJunsoo on 1/13/25.
//

import Foundation
import SwiftUI

enum Job {
    
}

struct Character {
    var name: String
    var hp: Int
    var atk: Int
    var def: Int
}

// Foreach 에 log.append시 id값 중복 오류로 인해 추가
struct LogEntry: Identifiable {
    let id = UUID()
    let message: String
}

class GamePlayModel: ObservableObject {
    @Published var player: Character
    @Published var monster: Monster
    @Published var log: [LogEntry] = []
    
    init() {
        player = Character(name: "모험가", hp: 100, atk: 10, def: 10)
        monster = Monster(name: "고블린", hp: 100, atk: 15, def: 5)
    }
    
    func playerAttack() -> Int {
        let damage = player.atk
        monster.hp -= damage - monster.def
        let trueDamage = damage - monster.def
    
//        log.append("\(player.name)가(이) \(monster.name)에게 \(trueDamage)피해를 입혔다!")
//        if monster.hp <= 0 {
//            log.append("\(player.name)가 \(monster.name)를 쓰려트렸다!")
//        } else {
//            _ = monsterAttack()
//        }
        return trueDamage
    }

    func playerDefense() -> Int {
        let damage = monster.atk
        player.hp -= damage - player.def
        return damage - player.def
    }
    
    func monsterAttack() -> Int {
        let damage = monster.atk
        player.hp -= damage - player.def
        let trueDamage = damage - player.def
        
//        log.append("\(monster.name)가(이) \(player.name)에게 \(trueDamage)피해를 입혔다!")
//        if player.hp <= 0 {
//            log.append("\(monster.name)가 \(player.name)를 쓰려트렸다!")
//        }
        return trueDamage
    }
    
    func addLog(_ message: String) {
            log.append(LogEntry(message: message))
    }
    
}
