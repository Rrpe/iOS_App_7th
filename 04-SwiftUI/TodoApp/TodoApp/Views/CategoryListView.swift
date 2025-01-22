//
//  CategoryListView.swift
//  TodoApp
//
//  Created by KimJunsoo on 1/21/25.
//

import SwiftUI
import SwiftData

struct CategoryListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var categories: [Category]
    
    @State private var selectedCategory: Category?
    @State private var isEditingCategory = false
    @State private var editCategoryName: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { category in
                    Text(category.name ?? "-")
                        .onLongPressGesture {
                            selectedCategory = category
                            editCategoryName = category.name ?? "-"
                            isEditingCategory = true
                        }
                }
                .onDelete(perform: deleteCategories)
            }
            .navigationTitle("카테고리 수정")
            .alert("카테고리 수정", isPresented: $isEditingCategory) {
                TextField("카테고리 이름", text: $editCategoryName)
                HStack {
                    Button("취소") {
                        editCategoryName = ""
                    }
                    Button("저장") {
                        
                    }
                }
            } message: {
                
            }
        }
    }
    
    func deleteCategories(at offsets: IndexSet) {
        for index in offsets {
            let category = categories[index]
            modelContext.delete(category)
        }
    }
}

#Preview {
    CategoryListView()
        .modelContainer(PreviewContainer.shared.container)
}
