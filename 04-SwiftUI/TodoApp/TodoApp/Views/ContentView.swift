//
//  ContentView.swift
//  TodoApp
//
//  Created by KimJunsoo on 1/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext     // 리스트 페이지로 modelContext 기능이 이동하여 삭제됨
    @Query private var todos: [TodoItem]
    
    @State private var showingAddTodo = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            TodoListView(searchText: searchText)
                .searchable(text: $searchText)
                .navigationTitle("Todo List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        // 버튼 클로저 방식
                        Button(action: {
                            showingAddTodo = true
                        }) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                .navigationBarBackButtonHidden(true) // 이게 안먹음
                .sheet(isPresented: $showingAddTodo) {
                    AddTodoView()
                }
        }
    }
    
    
    
    
}

#Preview {
    ContentView()
        .modelContainer(PreviewContainer.shared.container)
}


