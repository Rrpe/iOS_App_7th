
import SwiftUI

struct ContentView: View {
    
    var body: some View {
           
            Button(action: {
                Task {
                    await doSomething()
                }
            }) {
                Text("Do Something")
            }
    
        } // body View
    
        func doSomething() async {
            print("Start \(Date())")
            await takesTooLong()
            print("End \(Date())")
        }
        
        func takesTooLong() async {
            sleep(5)
            print("Asunc task completed at \(Date())")
        }
            
            
} // Content View

#Preview {
    ContentView()
}
