
let phrase: String = "The quick brown fox jumps over the lazy dog"
let numberOfFoxes: Int = 1
let numberOfAnimals: Int = 2

let averageCharactersPerWord: Float = (3+5+5+3+5+4+3+4+3) / 9
print(averageCharactersPerWord)

// 상수는 수정 불가능
//phrase = "The quick brown fox jumps over the lazy dog"

// 변수
var anotherPhrase: String = phrase
anotherPhrase = "The quick brown jumps over the lazy"
print(phrase)
print(anotherPhrase)

// 타입 추론
var phraseInfo = "The phrase" + " has: "
//phraseInfo = 1 문자열로 생성되었기 때문에, 다른 타입(정수형)의 값을 가질 수 없다.

phraseInfo += "\(numberOfFoxes) foxes"
print(phraseInfo)

print("Number of characters: \(phrase.count)")

// 다중 문법
let multilineExplanation = """
Why is the following phrase often used?
"The quick brown fox jumps over the lazy dog"
This phrase contains every letter in the alphabet.
"""

// bool
let phrasesAreEqual = phrase == anotherPhrase
print(phrasesAreEqual)

let phraseHas43Characters = phrase.count == 40 + 3
print(phraseHas43Characters)

let phraseHasMoreThan43Characters = phrase.count > 40 + 3
print(phraseHasMoreThan43Characters)
