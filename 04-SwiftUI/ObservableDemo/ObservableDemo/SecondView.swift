//
//  SecondView.swift
//  ObservableDemo
//
//  Created by KimJunsoo on 1/13/25.
//

import SwiftUI

struct SecondView: View {
    var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
        }
    }
    
}

#Preview {
    SecondView(timerData: TimerData())
}
