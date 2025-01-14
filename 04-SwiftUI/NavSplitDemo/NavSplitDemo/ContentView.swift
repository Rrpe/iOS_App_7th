//
//  ContentView.swift
//  NavSplitDemo
//
//  Created by KimJunsoo on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var categories = [
            IconCategory(categoryName: "Folders", images: ["questionmark.folder.ar",
                                                           "questionmark.folder",
                                                           "questionmark.folder.fill.ar",
                                                           "folder.fill.badge.gear",
                                                           "questionmark.folder.fill"]),
            IconCategory(categoryName: "Circles", images: ["book.circle",
                                                           "books.vertical.circle",
                                                           "books.vertical.circle.fill",
                                                           "book.circle.fill",
                                                           "book.closed.circle"]),
            IconCategory(categoryName: "Clouds", images: ["cloud.rain",
                                                          "cloud",
                                                          "cloud.drizzle.fill",
                                                          "cloud.fill",
                                                          "cloud.drizzle"])
    ]
    @State private var selectedCategory: IconCategory?
    
    var body: some View {
        NavigationSplitView {
            List(categories, selection: $selectedCategory) { category in
                Text(category.categoryName).tag(category)
                
            }
        } content: {
            
        } detail: {
            
        }
    }
}

#Preview {
    ContentView()
}
