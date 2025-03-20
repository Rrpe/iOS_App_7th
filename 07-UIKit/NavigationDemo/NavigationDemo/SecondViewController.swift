//
//  SecondViewController.swift
//  NavigationDemo
//
//  Created by KimJunsoo on 3/19/25.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UINavigationBarAppearance를 사용한 네비게이션 바 스타일 설정 - iOS 13+
        /// UINavigationBarAppearance 스타일링 클래스
        /// 1. standardAppearance: 일반적인 상태의 네비게이션 바 모양
        /// 2. scrollEdgeAppearance: 스크롤 뷰가 최상단에 있을 때의 모양
        /// 3. configureWithOpaqueBackground(): 불투명한 배경으로 설정
        /// 4. configureWithTransparentBackground(): 투명한 배경으로 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "두 번째 뷰"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
        
        // 왼쪽 취소 버튼 설정
        let lefeButton = UIBarButtonItem(systemItem: .cancel, primaryAction: UIAction { [weak self] _ in
            self?.leftButtonTapped()
        })
        navigationItem.leftBarButtonItem = lefeButton
        
        // 오른쪽 추가 버튼 설정
        let rightButton = UIBarButtonItem(title: "추가", primaryAction: UIAction { [weak self] _ in
            self?.rightButtonTapped()
        })
        
        // 편집 버튼 설정
        let editButton = UIBarButtonItem(systemItem: .edit, primaryAction: UIAction { [weak self] _ in
            self?.editButtonTapped()
        })
        
        // 검색 버튼 설정
        let searchButton = UIBarButtonItem(systemItem: .search, primaryAction: UIAction { [weak self] _ in
            self?.searchButtonTapped()
        })
        
        navigationItem.rightBarButtonItems = [rightButton, editButton, searchButton]
    }
    
    // 각 버튼에 대한 액션 함수
    func leftButtonTapped() {
        print("왼쪽 버튼 클릭")
        self.navigationController?.popViewController(animated: true) // 이전 화면으로 돌아가기
        /// 네비게이션 컨트롤러 작동 방식 - 뷰 컨트롤러를 스택으로 관리 (LIFO: Last In, First Out)
        /// pushViewController: 새로운 화면을 스택에 추가합니다
        /// popViewController: 현재 화면을 스택에서 제거하고 이전 화면으로 돌아갑니다
        /// rootViewController: 스택의 가장 아래에 있는 기본 화면입니다
    }
    
    func rightButtonTapped() {
        print("오른쪽 버튼 클릭")
    }
    
    func editButtonTapped() {
        print("편집 버튼 클릭")
    }
    
    func searchButtonTapped() {
        print("검색 버튼 클릭")
    }
    
    
}

#Preview {
    UINavigationController(rootViewController: ViewController())
}
