//
//  ContentView.swift
//  SchedulerDemo
//
//  Created by KimJunsoo on 4/10/25.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var demo = false
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $demo
            .dropFirst()
            .debounce(for: 3.0, scheduler: DispatchQueue.main)
            .sink { value in
                print("Main Thread: \(Thread.isMainThread)")
            }
            .store(in: &cancellables)
    }
    
}

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Toggle from main thread") {
                // 실행 흐름을 생성하여 비동기적으로 실행
                DispatchQueue.global().async {
                    viewModel.demo.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
