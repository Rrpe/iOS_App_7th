
import SwiftUI

extension VerticalAlignment {
    private enum OneThird: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
                    VStack { // 메인 화면
                        HStack(alignment: .oneThird) {
                            Rectangle()
                                .fill(.green)
                                .frame(width: 50, height: 200)
                            Rectangle()
                                .fill(.red)
                                .alignmentGuide(.oneThird) { d in d[VerticalAlignment.top] }
                                .frame(width: 50, height: 200)
                            Rectangle()
                                .fill(.blue)
                                .frame(width: 50, height: 200)
                            Rectangle()
                                .fill(.orange)
                                .alignmentGuide(.oneThird) { d in d[VerticalAlignment.top] }
                                .frame(width: 50, height: 200)
                                
                        }
                        
                        
                        // alignment 파라미터로 정렬
                        VStack(alignment: .trailing) {
                            Text("This is some text")
                            Text("This is some longer text")
                            Text("This is short")
                        }
                        // 텍스트를 기준으로 정렬하는 옵션 .lastTextBaseline -> HStack에서 사용
                        HStack(alignment: .lastTextBaseline, spacing: 20) {
                            Text("This is some text")
                                .font(.largeTitle)
                            Text("This is some much longer text")
                                .font(.body)
                            Text("This is short")
                                .font(.headline)
                        }
                        VStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 120, height: 50)
                            Rectangle()
                                .fill(Color.red)
                                .alignmentGuide(.leading,
                                                computeValue: { dimensions in dimensions.width / 3 })
                                .frame(width: 200, height: 50)
                            Rectangle()
                                .fill(Color.blue)
                                .alignmentGuide(.leading,
                                                computeValue: { dimensions in
                                    dimensions[.trailing] + 20 })
                                .frame(width: 180, height: 50)
                        }
                    }
            /*
                    .navigationTitle("네비게이션 바")
                    .navigationBarTitleDisplayMode(.inline) // 큰 타이틀 대신 작은 타이틀을 사용하려면 .inline
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                print("뒤로 버튼 클릭됨")
                            }) {
                                Image(systemName: "chevron.left")
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                print("설정 버튼 클릭됨")
                            }) {
                                Image(systemName: "gearshape")
                            }
                        }
                    }
             */
                }
        
    }
}

#Preview {
    ContentView()
}
