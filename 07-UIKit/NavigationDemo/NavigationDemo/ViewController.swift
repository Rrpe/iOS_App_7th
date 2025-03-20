//
//  ViewController.swift
//  NavigationDemo
//
//  Created by KimJunsoo on 3/18/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "네비게이션 타이틀"  // 네비게이션 바에 표시될 제목 설정
        
        // 네비게이션 바 스타일 커스터마이징
        self.navigationController?.navigationBar.barStyle = .default  // 기본 스타일 사용
        self.navigationController?.navigationBar.tintColor = .white  // 버튼 등의 색상을 흰색으로 설정
        self.navigationController?.navigationBar.isTranslucent = true  // 네비게이션 바 반투명 효과 활성화
        self.navigationController?.navigationBar.barTintColor = .systemBlue  // 네비게이션 바 배경색 설정
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]  // 타이틀 텍스트 색상 설정
        
        // 네비게이션 바의 큰 타이틀 설정 (현재 주석 처리됨)
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = .systemBlue  // 네비게이션 바 배경색 설정
        
        setupButton()  // 버튼 설정 함수 호출
    }
    
    func setupButton() {
        let button = UIButton(type: .system)  // 시스템 스타일 버튼 생성
        button.setTitle("다음 화면으로", for: .normal)  // 버튼 텍스트 설정
        button.titleLabel?.font = .systemFont(ofSize: 30)  // 버튼 텍스트 폰트 크기 설정
        
        // 버튼 액션 설정 - 터치 시 세그웨이 실행
        /// performSegue(withIdentifier:sender: "ID값")는 코드에서 세그웨이를 실행합니다
        button.addAction(UIAction{ [weak self] _ in
            self?.performSegue(withIdentifier: "showDetailSegue", sender: nil)
        }, for: .touchUpInside)
        
        // 오토레이아웃 설정
        button.translatesAutoresizingMaskIntoConstraints = false  // 자동 제약 조건 비활성화
        view.addSubview(button)  // 뷰에 버튼 추가
        NSLayoutConstraint.activate([  // 제약 조건 활성화
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // 화면 중앙 X축 정렬
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),  // 화면 중앙 Y축 정렬
        ])
    }
    
    /// prepare(for:sender:) 메서드는 세그웨이 실행 전에 호출되어 목적지 뷰 컨트롤러를 설정할 수 있게 합니다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 세그웨이 식별자 확인 및 목적지 뷰 컨트롤러 설정
        if segue.identifier == "showDetailSegue",
           let vc = segue.destination as? SecondViewController {
            vc.title = "다음 화면"  // 두 번째 화면의 타이틀 설정
            vc.view.backgroundColor = .systemYellow  // 두 번째 화면의 배경색 설정
        }
    }
}

#Preview {
    UINavigationController(rootViewController: ViewController())
}
