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

class GamePlayModel: ObservableObject {
    @Published var player: Character
    @Published var monster: Monster
    @Published var log: [String] = []
    
    init() {
        player = Character(name: "Player", hp: 100, atk: 10, def: 10)
        monster = Monster(name: "Goblin", hp: 100, atk: 15, def: 5)
    }
    
    func playerAttack() -> Int {
        let damage = player.atk
        monster.hp -= damage - monster.def
        return damage - monster.def
        
    }

    func playerDefense() -> Int {
        let damage = monster.atk
        player.hp -= damage - player.def
        return damage - player.def
    }
    
    func monsterAttack() -> Int {
        let damage = monster.atk
        player.hp -= damage - player.def
        return damage - player.def
    }
    
}
