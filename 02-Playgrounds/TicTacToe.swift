// 게임 보드를 표현하는 열거형
enum Piece {
    case empty
    case x
    case o
}

// 게임 상태를 표현하는 프로토콜
protocol GameState {
    var currentPlayer: Piece { get }
    // [[Piece]] 는 타입별칭을 만들 수 있다.
    var board: [[Piece]] { get } // 2차원 배열
    func isValidMove(row: Int, column: Int) -> Bool
}

// 게임 로직을 담당하는 클래스
class TicTacToe: GameState {
    var board: [[Piece]]
    var currentPlayer: Piece // 플레이어 설정
    
    init() {
        board = [[.empty, .empty, .empty],
                 [.empty, .empty, .empty],
                 [.empty, .empty, .empty]]
        currentPlayer = .x // x가 첫 번째 플레이어
    }
    
    // 유효한 움직임인지 확인
    func isValidMove(row: Int, column: Int) -> Bool {
        // TODO: isValidMove 메서드 구현
        let isValid = board[row][column] == .empty
        return isValid
    }
    
    func makeMove(row: Int, column: Int) -> Bool {
        // TODO: 플레이어 이동 메서드 구현
        guard isValidMove(row: row, column: column) else {
            return false
        }
        board[row][column] = currentPlayer
        
        // 플레이어 차례 변경
        if currentPlayer == .x {
            currentPlayer = .o
        } else {
            currentPlayer = .x
        }
        
        return true
    }
    
    func checkWinner() -> Piece? {
        // 승리조건 Add_2
        // 가로 [0,0] [0,1] [0,2], [1,0] [1,1] [1,2], [2,0] [2,1] [2,2]
        // 세로 [0,0] [1,0] [2,0], [0,1] [1,1] [2,1], [0,2] [1,2] [2,2]
        // 대각선 [0,0] [1,1] [2,2], [0,2] [1,1] [2,0]
        
        for i in 0..<3 {
            // 가로
            if board[i][0] != .empty && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
                return board[i][0]
            }
            //세로
            if board[0][i] != .empty && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
                return board[0][i]
            }
        }
            
        // 대각선 \
        if board[0][0] != .empty && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
            return board[0][0]
        }
        // 대각선 /
        if board[0][2] != .empty && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
            return board[0][2]
        }
        
        // 무승부
        // .empty칸이 있으면 아직 진행중 <-> .empty칸이 없으면 게임이 끝났음애도 승부가 안났으니 무승부
        return nil
    }
    
    func printBoard() {
        // 보드를 출력하는 코드
        print("---------------------------\n")
//        for row in board {
//            
//        }
        print("---------------------------\n")
    }
    
}

var game = TicTacToe()

while true {
    game.printBoard()
    print("\n현재 플레이어: \(game.currentPlayer)")
    
    print("행 입력 (0-2)('q' 입력시 종료): ", terminator: "")
    let rowInput = readLine() ?? ""
    if rowInput == "q" { break }
    // guard let row = Int(rowInput) else { continue } .. Add_1
    guard let row = Int(rowInput), (0...2).contains(row) else {
        print("잘못된 입력입니다. 0, 1, 2중 하나를 다시 입력하세요.")
        continue
    }
    // 항복 surrend 추가 해보기
    
    print("열 입력 (0-2)('q' 입력시 종료): ", terminator: "")
    let colInput = readLine() ?? ""
    if colInput == "q" { break }
    guard let column = Int(colInput), (0...2).contains(column) else {
        print("잘못된 입력입니다. 0, 1, 2중 하나를 다시 입력하세요.")
        continue
    }
    
    // 중복으로 둔 경우
    if !game.makeMove(row: row, column: column) {
        print("잘못된 위치입니다. 다시 시도해주세요.")
        continue
    }
    
    // 게임 결과
    if let winner = game.checkWinner() {
        game.printBoard()
        if winner == .empty {
            print("무승부")
        } else {
            print("'\(winner)'플레이어 승리!!! Winner Winner Chicken Dinner!!!")
        }
        break
    }
}
