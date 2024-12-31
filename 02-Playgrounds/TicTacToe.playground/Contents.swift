import Foundation

enum GridPosition: String {
    case empty = "-"
    case player1 = "o"
    case player2 = "x"
}

struct TicTacToe {
    var gridStorage: [[GridPosition]] = [] // Array<Array<GridPosition>> = []
    
    init () {
        for _ in 0..<3 {
            gridStorage.append(Array(repeating: .empty, count: 3)) // [.empty, .empty, empty]
        }
        // [ [.empty, .empty, empty],
        //   [.empty, .empty, empty],
        //   [.empty, .empty, empty] ]
    }
    
    // 접근자
    subscript(row: Int, column: Int) -> GridPosition {
        get { gridStorage[row][column] }
        set (newValue) { gridStorage[row][column] = newValue }
    }
    
    func gameStateString() -> String {
        var stateString = "---------------\n"
        for row in gridStorage {
            stateString += printableString(forRow: row)
            stateString += "\n"
        }
        stateString += "---------------\n"
        return stateString
    }
    
    func printableString(forRow row: [GridPosition]) -> String {
        var rowString = "|"
        for position in row {
            rowString += position.rawValue + "|"
        }
        return rowString
    }
}

// subscript 사용 전
var game = TicTacToe()
game.gridStorage[1][1] = .player1
game.gridStorage[0][2] = .player2
print(game.gameStateString())

// subscript 사용 후
game[0, 1] = .player1
print(game.gameStateString())

game[0, 0] = .player2
print(game.gameStateString())

game[2, 1] = .player1
print(game.gameStateString())
