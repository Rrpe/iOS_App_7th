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

// Dictionary
var bookDict1 : [String: String] = [
    "100-432112": "Wind in the Willows",
    "200-532874": "Tale of Two Cities",
    "202-546549": "Sense and Sensibility",
    "104-109834": "Shutter Island"
]

var myDictionary = [Int: String]()

let keys = ["100-432112", "200-532874", "202-546549", "104-109834"]
let values = ["Wind in the Willows", "Tale of Two Cities", "Sense and Sensibility", "Shutter Island"]

var bookDict = Dictionary(uniqueKeysWithValues: zip(keys, values))
print(bookDict.count)
print(bookDict["200-532874"] ?? "Book not found")

print("updateValue -----------------------------")
bookDict.updateValue("The Ruins", forKey: "200-532874")
for (key, value) in bookDict {
    print("key: \(key), value: \(value)")
}

print("-----------------------------")
bookDict["300-898871"] = "The Overlook"
for (key, value) in bookDict {
    print("key: \(key), value: \(value)")
}

print("removevalue -----------------------------")
bookDict["300-898871"] = nil // 값 제거
bookDict.removeValue(forKey: "300-898871")

for (key, value) in bookDict {
    print("key: \(key), value: \(value)")
}
