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
    @State private var priority: Priority
    
    init(todo: TodoItem) {
        self.todo = todo
        self._title = State(initialValue: todo.title)
        self._priority = State(initialValue: todo.priority)
    }
    
    var body: some View {
        // NavigationStack 이 팝업일 경우에만 사용되어 뷰에서 분리함
        // 다른 NavigationStack 에서 페이지를 부를 경우 오류가 발생함 (중복 NavigationStack)
        Form {
            Section {
                TextField("Title", text: $title)
                Picker("우선순위", selection: $priority) {
                    ForEach(Priority.allCases, id: \.self) {
                        priority in
                        Text(priority.title)
                            .tag(priority)
                    }
                }
            }
        }
        .navigationTitle("Edit Todo")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    // 수정 기능
                    todo.title = title
                    todo.priority = priority
                    // 뷰 닫기와 동시에 모델 컨텍스트 저장이 호출된다.
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Cancel") {
                    // 수정 취소 기능
                    dismiss()
                }
            }
        }
    }
}


#Preview {
    EditTodoView(todo: TodoItem(title: "Test Hello World"))
}
