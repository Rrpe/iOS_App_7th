import ComposableArchitecture
import SwiftUI

public struct ContentView: View {
    let store: StoreOf<CounterFeature>

    public var body: some View {
        VStack {
            Text("Count: \(store.count)")
                .font(.largeTitle)
                .padding()
            
            HStack {
                Button("-") {
                    store.send(.decrementButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                
                Button("+") {
                    store.send(.incrementButtonTapped)
                }
                .font(.largeTitle)
                .padding()
            }
            
            if store.isLoading {
                ProgressView()
                    .padding()
            }
            
            if let fact = store.fact {
                Text(fact)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            
            Button("Get Number Fact") {
                store.send(.factButtonTapped)
            }
            .padding()
        }
        .navigationTitle("Counter")
    }
}



#Preview {
    ContentView(
        store: Store(initialState: CounterFeature.State()) {
            CounterFeature()
                .dependency(\.numberFact, .liveValue)
                ._printChanges()
        }
    )
}
