//
//  ContentView.swift
//  GridDemo
//
//  Created by KimJunsoo on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    private var colors: [Color] = [.blue, .yellow, .green]
    private var gridItems = [ GridItem(.adaptive(minimum: 50)) ]
    /*private var gridItems = [ GridItem(.fixed(100)),
                              GridItem(.adaptive(minimum: 50)),
                              GridItem(.fixed(100)),]*/
//    private var gridItems = [ GridItem() ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems, spacing: 5) {
//            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach(0...99, id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index + 1)")
//            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
            .background(color)
            .clipShape(.rect(cornerRadius: 8))
            .font(.system(.largeTitle))
    }
}
