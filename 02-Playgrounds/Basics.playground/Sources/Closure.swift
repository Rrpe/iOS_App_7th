//
//  Closure.swift
//  
//
//  Created by KimJunsoo on 12/31/24.
//



/// Closure
/// - {} 중괄호로 감싸져있는 코드 블럭
/// - 변수에 할당 가능
/// - 함수 파라미터로 사용 가능
/// - 클로저 타입을 추론할 수 있어, 종종 생략할 수 있다.
/// - 함수의 마지막 인자가 클로저일 때, 후행 클로저로 더 읽기 쉽게 만든다.
/// - $(달러사인) 과 순번(1,2,3, ...)으로 파라미터의 이름(변수명)도 생략할 수 있다.
/// - 자신이 정의된 컨택스트(중괄호 스코프)에서 상수와 변수를 캡처할 수 있다.
public func runClosure() {
    // 클로저
    let simpleClosure = {
        print("Hello, World!")
    }
    simpleClosure()

    // in 앞은 값을 할당, in 뒤는 return 값 { (x: Int, y: Int) -> Int in return x * y}
    let multiply: (Int, Int) -> Int = { x, y in x * y }

    // 함수에 함수 던지는 방법 (?)
    func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
        return operation(a, b)
    }

    let addition: (Int, Int) -> Int = { x, y in x + y }

    let result = performOperation(5, 6, operation: addition)
    print(result)

    let result2 = performOperation(5, 6, operation: multiply)
    print(result2)

    // 인라인 함수 정의
    let result3 = performOperation(5, 6, operation: { x, y in x - y })
    print(result3)

    // 후행 클로저 : 함수 실행 후에 호출
    let numbers = [1, 2, 3, 4, 5]
    //let squaredNumbers = numbers.map { element in element * element }
    let squaredNumbers = numbers.map { $0 * $0 }
    print(squaredNumbers)

    /// Capturing Values 캡처값
    /// () -> Int 는 값이 아닌 함수를 반환 한다는 의미
    func makeIncrementer(incrementAmount: Int) -> () -> Int {
        var total = 0
        let incrementer: () -> Int = {
            total += incrementAmount
            return total
        }
        return incrementer
    }

    let incrementer = makeIncrementer(incrementAmount: 5)
    print(incrementer())
    print(incrementer())

    let incrementer2 = makeIncrementer(incrementAmount: 10)
    print(incrementer2())
    print(incrementer2())

    // Capturing Values - String Test
    func test_CapturingValues(incrementAmount: String) -> () -> String {
        var total = ""
        let incrementer: () -> String = {
            total += incrementAmount
            return total
        }
        return incrementer
    }

    var tester1 = test_CapturingValues(incrementAmount: "Hello")
    print(tester1())
    print(tester1())
    var tester1count = tester1().count
    print(tester1count)

}
