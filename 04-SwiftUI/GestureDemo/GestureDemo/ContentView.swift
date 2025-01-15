//
//  ContentView.swift
//  GestureDemo
//
//  Created by KimJunsoo on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    let tap = TapGesture(count: 2)
        .onEnded({ _ in
            print("Double Tap")}
        )
    
    let longPress = LongPressGesture()
        .onEnded({ _ in
            print("Long Press")}
        )
    
    @State var magnificationScale: CGFloat = 1.0

    var body: some View {
        let magnification = MagnificationGesture(minimumScaleDelta: 1)
            .onChanged({ value in
                print("Magnifying Change : \(value)")
                self.magnificationScale = value
            })
            .onEnded { _ in
                print("Magnification Ended")
            }
        
        Image(systemName: "hand.point.right.fill")
            .gesture(tap)
            .gesture(longPress)
            .gesture(magnification)
            .scaleEffect(magnificationScale)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ContentView()
}
