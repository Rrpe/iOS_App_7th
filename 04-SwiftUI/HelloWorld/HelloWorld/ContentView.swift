
import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            
            Button("Show Alert") {
                        showAlert = true
                    }
                    // 경고창 팝업을 띄우는 수정자
                    .alert("Important Message",
                           isPresented: $showAlert,
                           actions: {
                        Button("OK", role: .cancel) { }
                    }, message: {
                        Text("This is an alert message.")
                    })
            
        } // VStack
    } // body View
} // Content View

#Preview {
    ContentView()
}
