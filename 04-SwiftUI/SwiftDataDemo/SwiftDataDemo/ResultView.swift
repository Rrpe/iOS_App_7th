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
            let descriptor = FetchDescriptor<Product>(predicate: #Predicate<Product> { $0.name == name })
            do {
                matches = try modelContext.fetch(descriptor)
            } catch {
                print("Error fetching products: \(error)")
                matches = []
            }
        }
    }
}

#Preview {
    ResultView(name: "TT")
        .modelContainer(for: Product.self, inMemory: true)
}
