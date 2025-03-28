//
//  SharedData.swift
//  JRNL
//
//  Created by KimJunsoo on 3/28/25.
//

import Foundation

class SharedData {
    // MARK: - Properties
    static let shared = SharedData()
    private var journalEntries: [JournalEntry]
    
    // MARK: - Initializer
    private init() {
        journalEntries = []
    }
    
    // MARK: access methods
    
    // 데이터 개수 반환
    var numberOfJournalEntries: Int {
        return journalEntries.count
    }
    
    // 전체 데이터 반환
    func getAllJournalEntry() -> [JournalEntry] {
        return journalEntries
    }
    
    func getJounalEntry(at index: Int) -> JournalEntry {
        return journalEntries[index]
    }
    
    // 데이터 추가
    func addJournalEntry(_ entry: JournalEntry) {
        journalEntries.append(entry)
    }
    
    // 데이터 삭제
    func removeJournalEntry(at index: Int) {
        journalEntries.remove(at: index)
    }
}
