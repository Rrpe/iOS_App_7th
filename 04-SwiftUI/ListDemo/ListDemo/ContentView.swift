//
//  ContentView.swift
//  ListDemo
//
//  Created by KimJunsoo on 1/14/25.
//

import SwiftUI

// Identifiable 프로토콜을 준수하는 ToDoItem 구조체 정의
// UUID를 통해 각 항목을 고유하게 식별
struct ToDoItem: Identifiable {
    var id: UUID = UUID()
    var task: String
    var imageName: String
}

struct ContentView: View {
    // 토글 상태를 저장하는 State 변수
    @State var isOn: Bool = false
    
    // ToDo 항목들을 저장하는 State 배열
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                // 설정 섹션
                Section(header: Text("Settings")) {
                    // 알림 허용 토글 스위치
                    Toggle(isOn: $isOn) {
                        Text("Allow Notifications")
                    }
                    
                    NavigationLink(value: listData.count) {
                        Text("View Task Count")
                    }
                }
                
                // ToDo Task Session
                Section(header: Text("To Do Tasks").font(.caption2).textCase(nil)) {
                    // listData 배열의 각 항목을 순회하며 표시
                    ForEach(listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName) // SF Symbol
                                Text(item.task)                   // 할 일 텍스트
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Int.self) { count in
                Text("Number of tasks: \(count)")
            }
            .navigationDestination(for: String.self) { task in
                VStack {
                    Text("Selected Task: \(task)")
                }
                .navigationBarBackButtonHidden(true)
            }
            // 당겨서 새로고침 기능 추가
            .refreshable {
                // 새로운 ToDoList 갱신
                listData = [
                    ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                    ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
                ]
            }
        }
        
    }
}

#Preview {
    ContentView()
}
