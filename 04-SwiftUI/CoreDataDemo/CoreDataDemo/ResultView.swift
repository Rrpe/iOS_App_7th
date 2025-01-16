//
//  ResultView.swift
//  CoreDataDemo
//
//  Created by KimJunsoo on 1/16/25.
//

import SwiftUI
import CoreData

struct ResultView: View {
    var name: String
    var viewContext: NSManagedObjectContext
    
    @State var matches: [Product]?
    
    var body: some View {
        VStack {
            List {
                ForEach(matches ?? []) { match in
                    HStack {
                        Text(match.name ?? "Not found")
                        Spacer()
                        Text(match.quantity ?? "Not found")
                    }
                }
            }
            .navigationTitle("Result")
        }
        .task {
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
            fetchRequest.entity = Product.entity()
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", name) // abcd 있으면 ab, bc, cd 이렇게 연달아 썼는지
            matches = try? viewContext.fetch(fetchRequest)
        }
    }
}

