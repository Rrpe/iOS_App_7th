//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by KimJunsoo on 1/16/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Product.entity(), sortDescriptors: [])
    private var products: FetchedResults<Product>

    var body: some View {
        NavigationView {
            List {
                ForEach(products) { product in
                    NavigationLink {
                        Text("Item at \(product.name ?? "")")
                    } label: {
                        Text(product.name ?? "")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addProduct) {
                        Label("Add Product", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addProduct() {
        withAnimation {
            let newProduct = Product(context: viewContext)
            newProduct.name = "Test: \(Date())"//"Test"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { products[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


#Preview {
    ContentView()/*.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)*/
}
