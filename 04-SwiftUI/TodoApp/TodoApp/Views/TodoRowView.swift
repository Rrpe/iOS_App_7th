//
//  TodoRowView.swift
//  TodoApp
//
//  Created by KimJunsoo on 1/20/25.
//

import SwiftUI

struct TodoRowView: View {
    let todo: TodoItem
    
    @State private var showingEditView = false
    @State private var navigationToDetail = false
    
    var body: some View {
        // +Add Pro
        HStack {
            Button(action: {
                todo.isCompleted.toggle()
            }) {
                Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                    .foregroundStyle(todo.isCompleted ? .green : .gray)
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading) {
                Text(todo.title)
                    .strikethrough(todo.isCompleted)
                Text(todo.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .onLongPressGesture(minimumDuration: 0.5) {
                showingEditView = true
            }
        }
        .swipeActions(edge: .leading) {
            NavigationLink(value: TodoNavigation.detail(todo)) {
                Text("Detail")
            }
            .tint(.yellow)
        }
        .sheet(isPresented: $showingEditView) {
            EditTodoView(todo: todo)
        }
        
        /*HStack {
         Button(action: {
         item.isCompleted.toggle()
         }) {
         Image(systemName: item.isCompleted ? "checkmark.square.fill" : "square")
         .foregroundStyle(item.isCompleted ? .green : .gray)
         }
         
         NavigationLink(destination: TodoDetailView(item: item)) {
         Text("\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
         .background(.red)
         .foregroundStyle(.white)
         .onLongPressGesture {
         showingEditView = true
         }
         }
         }*/ // 내
        
    }
}

#Preview {
    NavigationStack {
        List {
            TodoRowView(todo: TodoItem(title: "Hello, World!"))
        }
        .navigationTitle("Todo List")
    }
}
