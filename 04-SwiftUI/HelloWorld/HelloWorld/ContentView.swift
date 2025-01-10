
import SwiftUI

enum DurationError: Error {
    case tooLong
    case tooShort
}

struct ContentView: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        var timeStamps: [Int: Date] = [:]
        timeStamps = await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1...5 {
                group.addTask {
                    return (i, await takesTooLong())
                }
            }
            var results: [Int: Date] = [:]
            for await (task, date) in group {
                results[task] = date
            }
            return results
        }
    }
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}

#Preview {
    ContentView()
}
