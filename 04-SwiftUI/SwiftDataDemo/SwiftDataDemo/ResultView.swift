//
//  ResultView.swift
//  SwiftDataDemo
//
//  Created by KimJunsoo on 1/16/25.
//

import SwiftUI
import SwiftData

struct ResultView: View {
    var name: String
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var matches: [Product] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(matches) { product in
                    HStack {
                        Text(product.name ?? "Not found")
                        Spacer()
                        Text(product.quantity ?? "Not found")
                    }
                }
            }
            .navigationTitle("Result")
        }
        .task {
            // FetchDescriptor : 영구 저장소에서 특정 모델 컬렉션을 선택, 정렬 기준을 설정하는 도구
            // 하나의 속성만 호출 가능. predicate : 가져올 속성과 타입. 추론 필수
            // sortBy : 정렬, fetchLimit : 결과 반환 갯수 정의
            let descriptor = FetchDescriptor<Product>(predicate: #Predicate<Product> { $0.name == name })

            // iOS 18 이상에서 복잡한 SwiftData 조건에 대해서는 #Expression 을 사용한다.
            /*let nameContains = #Expression<Product, Bool> { product in
                product.name?.localizedCaseInsensitiveContains(name) ?? false
            }
            
            let descriptor = FetchDescriptor<Product>(predicate: #Predicate<Product> {
                nameContains.evaluate($0)
            })*/
            
            do {
                // fetch : FetchDescriptor로 설정한 데이터를 가져옴
                matches = try modelContext.fetch(descriptor)
            } catch {
                print("Error fetching products: \(error)")
                matches = []
            }
        }
    }
}

#Preview {
    ResultView(name: "test")
        .modelContainer(for: Product.self, inMemory: true)
}
