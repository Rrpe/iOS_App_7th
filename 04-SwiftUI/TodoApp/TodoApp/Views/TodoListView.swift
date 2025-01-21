//
//  TodoListView.swift
//  TodoApp
//
//  Created by KimJunsoo on 1/20/25.
//

import SwiftUI
import SwiftData

// 한가지 데이터 타입에 대해서, 다른 네비게이션 경로를 가질경우
// enum 값을 이용해서, 분기 처리를 해야 한다.
// (NavigationLink 는 Hashable 값을 가져야 하기 때문에, Hashable 프로토콜을 추가 해준다. )
enum TodoNavigation: Hashable {
    case detail(TodoItem)
    case edit(TodoItem)
}

struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [TodoItem]
    
    let searchText: String
    init(searchText: String = "") {
        self.searchText = searchText
        
        let predicate = #Predicate<TodoItem> { todo in
            searchText.isEmpty ? true : todo.title.contains(searchText)
            //            searchText.isEmpty ? true : todo.title.localizedCaseInsensitiveContains(searchText)
            //            return items.filter { ($0.title ?? "").localizedCaseInsensitiveContains(searchText) } // 내가 사용한 방식
        }
        
        _todos = Query(filter: predicate, sort: [SortDescriptor(\TodoItem.createdAt)])
    }
    
    var body: some View {
        List {
            ForEach(todos) { item in
                TodoRowView(todo: item)
            }
            .onDelete(perform: deleteItems)
        }
        // 생성한 enum 값을 이용해서, 분기 처리를 한다.
        .navigationDestination(for: TodoNavigation.self) { navigation in
            switch navigation {
            case .detail(let item):
                TodoDetailView(item: item)
            case .edit(let item):
                EditTodoView(todo: item)
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
}

#Preview {
    TodoListView()
        .modelContainer(PreviewContainer.shared.container)
}


