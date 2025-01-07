let greeting = "Hello, World!"
print(greeting)

// 여러줄의 문자열
let multipleLines = """
동해물과 백두산이 마르고 닳도록
    하느님이 보우하사 우리나라
만세
"""
print(multipleLines)


// 문자열 보간
let name = "Swift"
let welcomeMessage = "Hello, \(name)!"
print(welcomeMessage)

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1.")

var newLine = "\n"
print(newLine)

var backslash = "\\"
print(backslash)

let escapedString = "줄바꿈: \\n, \n, 캐리지 리턴 \r, 탭: \t, 역슬래시\\, 따옴표\", 작은따옴표', 유니코드: \u{FC}"
print(escapedString)
