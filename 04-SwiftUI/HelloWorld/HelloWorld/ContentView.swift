
import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    
    var body: some View {
        VStack {
            
            Text("Tap me!")
                .font(.largeTitle)
                .padding()
                .background(isTapped ? Color.green : Color.red)
                .animation(.default, value: isTapped)
                // Tap 카운트를 이용해 실행시킬 탭 횟수를 조절할 수 있음
                .onTapGesture(count: 3) {
                    isTapped.toggle()
                }
            
        } // VStack
    } // body View
} // Content View

#Preview {
    ContentView()
}
