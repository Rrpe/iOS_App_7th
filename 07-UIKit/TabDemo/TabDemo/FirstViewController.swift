//
//  FirstViewController.swift
//  TabDemo
//
//  Created by KimJunsoo on 3/19/25.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "First"  // 네비게이션 바 타이틀 설정
        
        setupButton()  // 버튼 설정 함수 호출
    }
    
    func setupButton() {
        // 시스템 스타일 버튼 생성
        let button = UIButton(type: .system)
        
        // 버튼 속성 설정
        button.setTitle("데이터 전달", for: .normal)  // 버튼 텍스트 설정
        button.titleLabel?.font = .systemFont(ofSize: 20)  // 폰트 크기 설정
        button.sizeToFit()  // 내용에 맞게 버튼 크기 조정
        button.center = view.center  // 화면 중앙에 위치
        
        // 버튼 터치 액션 설정
        button.addAction(UIAction { [weak self] _ in
            self?.didTapButton()  // 버튼 클릭 시 didTapButton 함수 호출
        }, for: .touchUpInside)
        
        view.addSubview(button)  // 뷰에 버튼 추가
    }
    
    func didTapButton() {
        // 데이터 생성 및 싱글톤 매니저를 통해 업데이트
        let data = "전달할 데이터입니다."
        DataManager.shared.updateData(data)  // 공유 데이터 매니저를 통해 데이터 업데이트
    }
}
