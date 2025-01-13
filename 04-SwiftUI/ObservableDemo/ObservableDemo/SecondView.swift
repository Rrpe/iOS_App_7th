//
//  SecondView.swift
//  ObservableDemo
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct SecondView: View {
    @Environment(TimerData.self) var timerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
        }
    }
    
}

#Preview {
    SecondView()
        .environment(TimerData())
}
