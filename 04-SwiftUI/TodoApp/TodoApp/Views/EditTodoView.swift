//
//  EditTodoView.swift
//  TodoApp
//
//  Created by KimJunsoo on 1/20/25.
//

import SwiftUI

struct EditTodoView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let todo: TodoItem
    
    @State private var title: String = ""
    
    init(todo: TodoItem) {
        self.todo = todo
        self._title = State(initialValue: todo.title)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        todo.title = title
                        dismiss()
                    }
                }
            }
            .navigationTitle("Edit View")
        }
    }
}

#Preview {
    EditTodoView(todo: TodoItem(title: "Test Hello World"))
}
