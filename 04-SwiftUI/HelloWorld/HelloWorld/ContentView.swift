
import SwiftUI

struct ContentView: View {
    
    var body: some View {
           
            Button(action: {
                doSomething()
            }) {
                Text("Do Something")
            }
    
        } // body View
    
        func doSomething() {
            print("Start \(Date())")
            takesTooLong()
            print("End \(Date())")
        }
        
        func takesTooLong() {
            sleep(5)
            print("Asunc task completed at \(Date())")
        }
            
            
} // Content View

#Preview {
    ContentView()
}
