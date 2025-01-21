//
//  ContentView.swift
//  TodoApp
//
//  Created by KimJunsoo on 1/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // 리스트 페이지로 modelContext 기능이 이동하여 삭제됨
    
    @State private var showingAddTodo = false
    @State private var searchText = ""
    @State private var priorityFilter: Priority? = nil
        
    var body: some View {
        TabView {
            NavigationStack {
                VStack {
                    HStack {
                        Button {
                            priorityFilter = nil
                        } label: {
                            Text("전체")
                                .font(.caption)
                                .padding(4)
                                .foregroundColor(.white)
                                .background(.gray)
                                .clipShape(.rect(cornerRadius: 4))
                                .overlay {
                                    if priorityFilter == nil {
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(.blue, lineWidth: 2)
                                    }
                                }
                            
                        }
                        ForEach([Priority.low, Priority.medium, Priority.high], id: \.self) { priority in
                            Button {
                                priorityFilter = priority
                            } label: {
                                PriorityBadge(priority: priority)
                            }
                            .overlay {
                                if priorityFilter == priority {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.blue, lineWidth: 2)
                                }
                            }
                        }
                    }
                    TodoListView(searchText: searchText, priorityFilter: priorityFilter)
                        .searchable(text: $searchText, prompt: "할 일 검색")
                        .navigationTitle("Todo List")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                EditButton()
                            }
                            ToolbarItem {
                                Button(action: {
                                    showingAddTodo = true
                                }) {
                                    Label("Add Item", systemImage: "plus")
                                }
                            }
                        }
                }
            }
            .tabItem {
                Label("목록", systemImage: "list.bullet")
            }
            CalendarView()
                .tabItem {
                    Label("달력", systemImage: "calendar")
                }
        }
        .sheet(isPresented: $showingAddTodo) {
            AddTodoView()
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(PreviewContainer.shared.container)
}


