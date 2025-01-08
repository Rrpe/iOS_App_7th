var tree: [String] = ["Pine","Oak","Yew"]
var tree2: Array<String> = ["Pine","Oak","Yew"]

var emptyArray: [String] = []
var emptyArray2 = Array<String>()

var nameArray = [String](repeating: "My String", count: 10)

var firstArray = ["Red","Green","Blue"]
let secondArray: [String] = ["Indigo","Violet"]
let thirdArray = firstArray + secondArray + tree

firstArray.append("Orange")

print(thirdArray.count)

if !thirdArray.isEmpty {
    print("thirdArray is not empty")
}

if thirdArray.contains("Oak") {
    print("thirdArray contains Oak")
}

// 배열 인덱스 1번에 "Maple" 값을 추가 ( 배열의 인덱스 1번은 2번째 요소임. )
firstArray.insert("Maple", at: 1)
print(firstArray)

firstArray.remove(at: 1)
print(firstArray)

firstArray.removeAll(where: { $0 == "Blue" })
print(firstArray)

let removeItem = firstArray.removeLast()
print(removeItem)

firstArray.removeAll()
print(firstArray)

// 배열의 요소 반복 반환 값이 없다
secondArray.forEach { print($0) }


// Any 혼합 타입 배열과 타입 캐스팅
let mixedArray: [Any] = ["A String", 432, 34.989]

for object in mixedArray {
    if let intValue = object as? Int {
        print("intValue: \(intValue)")
    } else if let doubleValue = object as? Double {
        print("doubleValue: \(doubleValue)")
    } else if let stringValue = object as? String {
        print("stringValue: \(stringValue)")
    }
}
