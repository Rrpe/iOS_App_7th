//
//  ContentView.swift
//  ListDemo
//
//  Created by KimJunsoo on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        List {
            Text("Wash the car")
            Text("Vacuum house")
            Text("Pick up kids from school bus @ 3pm")
            Text("Auction the kids on eBay")
            Text("Order Pizza for dinner")
            
            HStack {
                Image(systemName: "trash.circle.fill")
                Text("Take out the trash")
            }
            HStack {
                Image(systemName: "person.2.fill")
                Text("Pick up the kids")
            }
            HStack {
                Image(systemName: "car.fill")
                Text("Wash the car")
            }
            Text("Wash the car")
                .listRowSeparator(.hidden)
            Text("Pick up kids from school bus @ 3pm")
                .listRowSeparatorTint(.green)
            Text("Auction the kids on eBay")
                .listRowSeparatorTint(.red)
            Text("Order Pizza for dinner")
//                .listRowBackground(Color.red)
                .listRowBackground(Image("image1"))
        } // List
        
    }
}

#Preview {
    ContentView()
}
