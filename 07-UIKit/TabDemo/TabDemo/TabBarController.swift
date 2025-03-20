//
//  TabBarController.swift
//  TabDemo
//
//  Created by KimJunsoo on 3/19/25.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 탭바 외관 설정
        let appearance = UITabBarAppearance()  // 탭바 모양 객체 생성
        appearance.backgroundColor = .systemBackground  // 배경색을 시스템 기본 배경색으로 설정
        
        // 설정한 모양을 탭바에 적용
        tabBar.standardAppearance = appearance  // 일반 상태의 탭바 모양 설정
        tabBar.scrollEdgeAppearance = appearance  // 스크롤 시 탭바 모양 설정
        
        setupTabBar()  // 탭바 설정 함수 호출
    }
    
    func setupTabBar() {
        // 각 탭에 표시할 뷰 컨트롤러 생성
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        
        // 각 뷰 컨트롤러를 네비게이션 컨트롤러로 래핑
        // 이를 통해 각 탭 내에서 추가 화면 스택을 관리할 수 있음
        let firstNavController = UINavigationController(rootViewController: firstVC)
        let secondNavController = UINavigationController(rootViewController: secondVC)
        
        // 탭바 컨트롤러에 뷰 컨트롤러 배열 설정
        self.viewControllers = [firstNavController, secondNavController]
        
        // 탭바 아이템 설정 (주석 처리된 코드는 다른 방식의 탭바 아이템 설정 예시)
        /*firstNavController.tabBarItem = UITabBarItem(title: "1", image: UIImage(systemName: "1.circle"), selectedImage: UIImage(systemName: "1.circle.fill"))
         secondNavController.tabBarItem = UITabBarItem(title: "2", image: UIImage(systemName: "2.circle"), selectedImage: UIImage(systemName: "2.circle.fill"))*/
        
        // 첫 번째 탭 아이템 설정 - 제목, 이미지, 태그
        firstNavController.tabBarItem = UITabBarItem(title: "첫번째", image: UIImage(systemName: "1.circle"), tag: 0)
        
        // 두 번째 탭 아이템 설정 - 제목, 이미지, 태그
        secondNavController.tabBarItem = UITabBarItem(title: "두번째", image: UIImage(systemName: "2.circle"), tag: 1)
    }
}

#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
