//
//  PreviewContainer.swift
//  TodoApp
//
//  Created by KimJunsoo on 1/20/25.
//

import Foundation
import SwiftData

@MainActor
class PreviewContainer {
    static let shared: PreviewContainer = PreviewContainer()
    
    let container: ModelContainer
    
    init() {
        let schema = Schema([
            TodoItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema,
                                                    isStoredInMemoryOnly: true,
                                                    cloudKitDatabase: .none)
        do {
            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertPreviewData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertPreviewData() {
        let today = Date()
        let calendar = Calendar.current
        let dueDate = calendar.date(byAdding: .day, value: 1, to: today)!
        
        let todos: [(String, Date, Priority, Date, Category?)] = [
            ("Buy groceries", today, .low, dueDate, nil),
            ("Walk the dog", calendar.date(byAdding: .day, value: 1, to: today)!, .medium, dueDate, nil),
            ("Do the laundry", calendar.date(byAdding: .day, value: 2, to: today)!, .medium, dueDate, nil),
            ("Take out the trash", calendar.date(byAdding: .day, value: 3, to: today)!, .low, dueDate, nil),
            ("완료된 작업", calendar.date(byAdding: .day, value: 4, to: today)!, .low, dueDate, nil),
            ("운동하기", calendar.date(byAdding: .day, value: 5, to: today)!, .high, dueDate, nil),
            ("책 읽기", calendar.date(byAdding: .day, value: 6, to: today)!, .high, dueDate, nil),
            ("SwiftUI 공부", calendar.date(byAdding: .day, value: 7, to: today)!, .high, dueDate, nil),
        ]
        
        for (title, date, priority, due, category) in todos {
            let todo = TodoItem(title: title, priority: priority, dueDate: due, category: category, createdAt: date)
            container.mainContext.insert(todo)
        }
        
        // 첫번째 투두를 완료 상태로 변경
        if let firstTodo = try? container.mainContext.fetch(FetchDescriptor<TodoItem>()).first {
            firstTodo.isCompleted = true
        }
        
        // 변경사항을 저장
        try? container.mainContext.save()
    }
}
