// import UIKit: iOS UI 관련 프레임워크
import UIKit

// SecondViewController와 통신하기 위한 프로토콜 선언
protocol SecondViewControllerDelegate: AnyObject {
  // SecondViewController가 닫힐 때 호출될 메서드 정의
  func didDismissSecondViewController(message: String)
}

// UIViewController를 상속받은 SecondViewController 클래스
class SecondViewController: UIViewController {
  // delegate 변수를 약한 참조(weak)로 선언하여 메모리 누수 방지
  weak var delegate: SecondViewControllerDelegate?

  // lazy var: 텍스트 필드를 지연 초기화
  lazy var messageTextField: UITextField = {
    let textField = UITextField() // 텍스트 필드 생성
    textField.placeholder = "메시지를 입력하세요." // 플레이스홀더 설정
    textField.borderStyle = .roundedRect // 테두리 스타일 설정
    return textField
  }()

  // 뷰가 메모리에 로드된 후 호출
  override func viewDidLoad() {
    super.viewDidLoad()
    print("01 SecondViewController.viewDidLoad()")
    setupUI() // UI 설정 메서드 호출
  }

  // 뷰가 화면에 나타나기 직전에 호출
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("02 SecondViewController.viewWillAppear()")
  }

  // 뷰가 나타나는 과정에 호출
  override func viewIsAppearing(_ animated: Bool) {
    super.viewIsAppearing(animated)
    print("03 SecondViewController.viewIsAppearing()")
  }

  // 뷰가 화면에 완전히 나타난 후 호출
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("04 SecondViewController.viewDidAppear()")
  }

  // 뷰가 화면에서 사라지기 직전에 호출
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("05 SecondViewController.viewWillDisappear()")
  }

  // 뷰가 화면에서 완전히 사라진 후 호출
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("06 SecondViewController.viewDidDisappear()")
  }

  // UI 요소 설정 메서드
  func setupUI() {
    print("07 SecondViewController.setupUI()")
    self.view.backgroundColor = .yellow // 배경색 노란색으로 설정

    // "Second View" 라벨 생성 및 설정
    let label = UILabel()
    label.text = "Second View"
    label.textAlignment = .center
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 24)
    // frame을 사용한 위치/크기 설정 (오토레이아웃 대신)
    label.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40)
    self.view.addSubview(label) // 뷰에 라벨 추가

    // 텍스트 필드의 위치와 크기 설정
    messageTextField.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 40)
    self.view.addSubview(messageTextField) // 뷰에 텍스트 필드 추가

    // "Submit" 버튼 생성 및 설정
    let button = UIButton()
    button.setTitle("Submit", for: .normal) // 버튼 텍스트
    button.setTitleColor(.blue, for: .normal) // 텍스트 색상
    // 버튼 위치와 크기 설정
    button.frame = CGRect(x: 20, y: 300, width: view.frame.width - 40, height: 40)

    // 버튼 클릭 이벤트 처리 (새로운 UIAction API 사용)
    button.addAction(UIAction { [weak self] _ in
      self?.dismiss(animated: true) // 현재 화면 닫기
      // delegate 메서드 호출하여 메시지 전달
      self?.delegate?.didDismissSecondViewController(message: self?.messageTextField.text ?? "")
    }, for: .touchUpInside)

    self.view.addSubview(button) // 뷰에 버튼 추가
  }
}
