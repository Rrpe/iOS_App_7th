
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            FirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                    Text("First")
                }
        
        
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
        }
        
    } // body View
} // Content View

#Preview {
    ContentView()
}
