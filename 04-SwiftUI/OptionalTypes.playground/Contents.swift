var index: Int?
index = 3

var treeArray = ["Oak", "Apple", "Banana", "Birch"]

if index != nil {
    print(treeArray[index!]) // 강제 언래핑
} else {
    print("값이 할당되지 않았을때")
}

if let index {
    // 이 중괄호 안에서는 옵셔널이 아닌 Int 타입으로 사용 가능
    print(treeArray[index])
}

var optionalName1: String?
var optionalName2: String?
var optionalName3: String?

optionalName1 = "Swift"
optionalName2 = "Programming"
optionalName3 = "Language"

if let optionalName1, let optionalName2, let optionalName3 {
    print("\(optionalName1) \(optionalName2) \(optionalName3)")
}
