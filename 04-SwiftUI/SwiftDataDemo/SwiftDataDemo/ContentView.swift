//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by KimJunsoo on 1/16/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var name: String = ""
    @State var quantity: String = ""
    
    // @Environment : ModelContainer를 뷰에 전달받아 데이터베이스 작업(추가, 삭제 등)을 처리
    // modelContext : SwiftData 데이터 작업 중심 역할. 쿼리문 작업 가능할 수 있게 해줌. get set 자동 지원
    @Environment(\.modelContext) private var modelContext
    
    // @Query : 연결된 모델 유형의 모든 인스턴스를 가져옴
    @Query private var products: [Product]

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button(action: {
                        addProduct()
                        name = ""
                        quantity = ""
                    }, label: {
                        Text("Add")
                    })
                    Spacer()
                    NavigationLink(destination: ResultView(name: name)) {
                        Text("Find")
                    }
                    Spacer()
                    Button(action: {
                        name = ""
                        quantity = ""
                    }, label: {
                        Text("Clear")
                    })
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                List {
                    ForEach(products) { product in
                        NavigationLink {
                            Text("Product at \(product.name ?? "Not found")")
                        } label: {
                            HStack {
                                Text(product.name ?? "Not found")
                                Spacer()
                                Text(product.quantity ?? "Not found")
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
//                .searchable(text: $name)
                .navigationTitle("Products")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
            }
        }
        .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    

    private func addProduct() {
        withAnimation {
            let newItem = Product(name: name, quantity: quantity)
            // insert() 데이터베이스에 저장되기 전 준비상태로 등록
            // rollback()으로 등록 취소 가능
            // save()를 해야 저장됨
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                // delete() 데이터베이스 삭제
                // save() 꼭 사용 해줄 것
                modelContext.delete(products[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Product.self, inMemory: true)
}
