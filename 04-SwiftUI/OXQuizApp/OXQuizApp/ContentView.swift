
import SwiftUI

// ViewModifier Protocol 호출
// SwiftUI View Style을 각자 스타일로 Custom하여 캡슐화하여 재사용 가능 형태로 정의
struct IconStyle: ViewModifier {
    func body(content: Content) -> some View { // 필수 구현 메서드
        content
            .font(.system(size: 30))
            .foregroundColor(.black)
    }
}

struct ContentView: View {
    @State var number1: Int = Int.random(in: 0...10)
    @State var operatorSymbol: String = ["+","−","×"].randomElement() ?? "+"
    @State var number2: Int = Int.random(in: 0...20)
    @State var resultNumber: Int = Int.random(in: -10...30)
    
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    var body: some View {
        let title = "🅾️❎ 퀴즈 맞추기"
        
        VStack {
            Spacer()
            HStack {
                Image(systemName: "circle.circle.fill").modifier(IconStyle())
                Image(systemName: "square.circle.fill").modifier(IconStyle())
                Image(systemName: "triangle.circle.fill").modifier(IconStyle())
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
            Text("\(number1) \(operatorSymbol) \(number2) = \(resultNumber)")
                .font(.system(size: 40))
                .bold()
                .frame(width: 300, height: 100, alignment: .center)
                .border( Color.black, width: 1)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 1))
            
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    selectCorrect()
                }) {
                    Image(systemName: "circle.circle.fill")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundStyle(.green)
                    Text("정답")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundStyle(.green)
                        
                }
                Spacer()
                Button(action: {
                    selectWrong()
                }) {
                    Image(systemName: "xmark.square")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundStyle(.red)
                    Text("오답")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundStyle(.red)
                }
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Text("\(countCorrect)개 맞춤")
                    .font(.system(size: 24, weight: .medium))
                Spacer()
                Text("\(countWrong)개 틀림")
                    .font(.system(size: 24, weight: .medium))
                Spacer()
            }
            Spacer()
            Button(action: {
                reloadGame()
            }) {
                Image(systemName: "gobackward")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(Color(red: 255/255, green: 215/255, blue: 0/255, opacity: 1.0))
                Text("리셋")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(Color(red: 255/255, green: 215/255, blue: 0/255, opacity: 1.0))
            }
            Spacer()
        }
//        .onAppear() { newQuestion() }
    }
    
    func reloadGame() {
        countWrong = 0
        countCorrect = 0
        newQuestion()
    }
    
    func selectCorrect() {
        countCorrect += 1
        newQuestion()
    }
    
    func selectWrong() {
        countWrong += 1
        newQuestion()
    }
    
    func newQuestion() {
        let _number1: [Int] = [5, 4, 9, 1, 10]
        let _operatorSymbol: [String] = ["+","−","×"]
//        let _number2: Double = Double.random(in: -10...10)
        let _number2: [Int] = [2, 4, 3, 4, 7]
        let _resultNumber: [Int] = [10, 20, 2, 9, -2, 2, 0, 7, 8, -3, 7, 13, 12, 13, 2, 3, -3, 4, -3, 8]
        
        number1 = _number1.randomElement() ?? 5
        operatorSymbol = _operatorSymbol.randomElement() ?? "+"
        number2 = _number2.randomElement() ?? 2
        resultNumber = _resultNumber.randomElement() ?? 10
    }
}



#Preview {
    ContentView()
}
