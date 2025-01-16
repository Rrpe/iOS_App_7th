//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by KimJunsoo on 1/16/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var name: String = ""
    @State var quantity: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Product.entity(), sortDescriptors: [])
    private var products: FetchedResults<Product>

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button(action: {
                        addProduct()
                    }, label: {
                        Text("Add")})
                    Spacer()
                    Button(action: {
                        name = ""
                        quantity = ""
                    }, label: {
                        Text("Clear")})
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                List {
                    ForEach(products) { product in
                        HStack {
                            Text(product.name ?? "Not found")
                            Spacer()
                            Text(product.quantity ?? "Not found")
                        }
                    }
                }
                .navigationTitle("Product Database")
            }
            .padding()
            .textFieldStyle(.automatic)
        }
    }

    private func addProduct() {
        
    }

    private func deleteItems(offsets: IndexSet) {
        
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
