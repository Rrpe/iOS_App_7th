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
        /*ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems, spacing: 5) {
//            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach(0...99, id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
        }*/
        Grid(alignment: .leading, verticalSpacing: 15) {
                    GridRow {
                        ForEach(1...5, id: \.self) { index in
                            if (index % 2 == 1) {
                                CellContent(index: index, color: .red)
                            } else {
                                Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                            }
                        }
                    }
                    GridRow {
                        ForEach(6...10, id: \.self) { index in
                            CellContent(index: index, color: .blue)
                        }
                    }
                    GridRow {
                        ForEach(11...15, id: \.self) { index in
                            CellContent(index: index, color: .green)
                        }
                    }
                    // Grid 뷰를 추가할 수 있다.
                    CellContent(index: 16, color: .blue)

                    // 셀 병합도 가능하다.
                    GridRow {
                        CellContent(index: 17, color: .orange)
                            .gridCellColumns(2)
                        CellContent(index: 18, color: .indigo)
                            .gridCellColumns(3)
                    }
                }
                .padding()
    }
}

#Preview {
    ContentView()
}

struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
//            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
            .background(color)
            .clipShape(.rect(cornerRadius: 8))
            .font(.system(.largeTitle))
    }
}