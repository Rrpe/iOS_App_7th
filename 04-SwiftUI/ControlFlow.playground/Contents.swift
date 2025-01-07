
// for-in 루프
for i in 1...10 {
    print("Hello, World! \(i)")
}

var count = 0
for _ in 1...5 {
    count += 1
}
print("for in count: \(count)")

while count < 10 {
    count += 1
    print("while count: \(count)")
}

// repeat - while
count = 1
repeat {
    print("repeat while : \(count)")
    count += 1
} while count < 10

// while 루프 내부에 종료 조건이 없으면 무한 루프가 됩니다.
while true {
    print("while true : \(count)")
    count -= 1
    if count < 0 {
        // 루프를 빠져나가는 키워드 : break
        print("break \(count)")
        break
    }
}
