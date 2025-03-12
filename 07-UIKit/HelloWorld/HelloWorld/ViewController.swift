// import UIKit: iOS 개발에 필요한 사용자 인터페이스 관련 프레임워크 불러오기
import UIKit

// UIViewController를 상속받고, SecondViewControllerDelegate 프로토콜을 채택한 ViewController 클래스
class ViewController: UIViewController, SecondViewControllerDelegate {
    
    // lazy var: 실제로 사용될 때까지 초기화를 지연시키는 변수 선언 방식
    // myLabel이 처음 접근될 때 중괄호 내부 코드가 실행됨
    lazy var myLabel: UILabel = {
        print("myLabel 생성") // 처음 접근할 때만 출력됨
        let label = UILabel() // UILabel 객체 생성
        label.text = "입력 결과를 출력합니다." // 초기 텍스트 설정
        label.textAlignment = .center // 텍스트 가운데 정렬
        label.textColor = .black // 텍스트 색상 검정
        label.font = UIFont.systemFont(ofSize: 24) // 폰트 크기 24
        label.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃 수동 설정 활성화
        return label // 설정된 UILabel 반환
    }()
    
    // 뷰가 메모리에 로드된 후 호출되는 라이프사이클 메서드
    override func viewDidLoad() {
        super.viewDidLoad() // 부모 클래스의 viewDidLoad() 호출
        print("01 ViewController.viewDidLoad()") // 디버깅용 로그
        setupUI() // UI 설정 메서드 호출
    }
    
    // UI 요소들을 설정하는 메서드
    func setupUI() {
        // "Hello, World!" 라벨 생성 및 설정
        let label = UILabel()
        label.text = "Hello, World!"
        label.textAlignment = .center // 텍스트 가운데 정렬
        label.textColor = .black // 텍스트 색상 검정
        label.font = UIFont.systemFont(ofSize: 24) // 폰트 크기 24
        label.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃 수동 설정 활성화
        self.view.addSubview(label) // 메인 뷰에 라벨 추가
        
        // 오토레이아웃 제약조건 설정 및 활성화
        NSLayoutConstraint.activate([
            // 상단 제약: 뷰 상단에서 100 포인트 아래
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            // 좌측 제약: 뷰 좌측에서 20 포인트 오른쪽
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            // 우측 제약: 뷰 우측에서 20 포인트 왼쪽
            label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            // 높이 제약: 40 포인트 고정
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // "Go Second" 버튼 생성 및 설정
        let button = UIButton()
        button.setTitle("Go Second", for: .normal) // 버튼 텍스트
        button.setTitleColor(.blue, for: .normal) // 텍스트 색상 파랑
        // 터치 이벤트 발생 시 goSecond 메서드 호출
        button.addTarget(self, action: #selector(goSecond), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃 수동 설정 활성화
        
        self.view.addSubview(button) // 메인 뷰에 버튼 추가
        
        // 버튼의 오토레이아웃 제약조건 설정
        NSLayoutConstraint.activate([
            // 상단 제약: 라벨 상단에서 100 포인트 아래
            button.topAnchor.constraint(equalTo: label.topAnchor, constant: 100),
            // 좌측 제약: 뷰 좌측에서 20 포인트 오른쪽
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            // 우측 제약: 뷰 우측에서 20 포인트 왼쪽
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            // 높이 제약: 40 포인트 고정
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // lazy var로 선언된 myLabel을 뷰에 추가
        self.view.addSubview(myLabel)
        
        // myLabel의 오토레이아웃 제약조건 설정
        NSLayoutConstraint.activate([
            // 상단 제약: 버튼 상단에서 100 포인트 아래
            myLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: 100),
            // 좌측 제약: 뷰 좌측에서 20 포인트 오른쪽
            myLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            // 우측 제약: 뷰 우측에서 20 포인트 왼쪽
            myLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            // 높이 제약: 40 포인트 고정
            myLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // SecondViewControllerDelegate 프로토콜 메서드 구현
    // SecondViewController가 사라질 때 호출되며, 전달받은 메시지로 myLabel 업데이트
    func didDismissSecondViewController(message: String) {
        myLabel.text = message // 전달받은 메시지로 라벨 텍스트 변경
    }
    
    // @objc: Objective-C 코드와 상호작용하기 위한 annotation
    // "Go Second" 버튼 클릭 시 호출되는 메서드
    @objc func goSecond() {
        let secondVC = SecondViewController() // SecondViewController 인스턴스 생성
        secondVC.delegate = self // 자신을 delegate로 설정
        self.present(secondVC, animated: true) // 화면에 SecondViewController 표시
    }
}
