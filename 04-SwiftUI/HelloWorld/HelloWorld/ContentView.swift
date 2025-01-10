
import SwiftUI

enum DurationError: Error {
    case tooLong
    case tooShort
}

struct ContentView: View {
    var body: some View {
        Button(action: {
            // 작업의 우선순위를 결정할 수 있다.
            Task(priority: .high) {
                // 작업의 우선순위를 확인하는 프로퍼티
                _ = Task.currentPriority
                // 작업의 취소 여부를 확인하는 프로퍼티
                _ = Task.isCancelled
                // 다음 작업을 먼저하라고 양보하는 프로퍼티
                await Task.yield()
                await doSomething()
            }
            // 분리된 작업
            let detachedTask = Task.detached {
                await doSomething()
            }
            
            if(!detachedTask.isCancelled) {
                // 작업 취소
                detachedTask.cancel()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        print("Start \(Date())")
        do {
            try await takesTooLong(delay: 6)
        } catch DurationError.tooShort {
            print("Error: Duration too short")
        } catch DurationError.tooLong {
            print("Error: Duration too long")
        } catch {
            print("Unknown error")
        }
        print("End \(Date())")
    }
    
    func takesTooLong(delay: UInt32) async throws {
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        sleep(delay)
        print("Async task completed at \(Date())")
    }

} // Content View

#Preview {
    ContentView()
}
