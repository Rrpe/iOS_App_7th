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
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemBackground
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        setupTabBar()
    }
    
    func setupTabBar() {
        // 뷰 컨트롤러 설정
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        
        // 네비게이션 컨트롤러 설정
        let firstNavController = UINavigationController(rootViewController: firstVC)
        let secondNavController = UINavigationController(rootViewController: secondVC)
        
        // 탭 바 뷰 컨트롤러 배열 설정
        self.viewControllers = [firstNavController, secondNavController]
        
        // 탭바 아이템 설정
        /*firstNavController.tabBarItem = UITabBarItem(title: "1", image: UIImage(systemName: "1.circle"), selectedImage: UIImage(systemName: "1.circle.fill"))
         secondNavController.tabBarItem = UITabBarItem(title: "2", image: UIImage(systemName: "2.circle"), selectedImage: UIImage(systemName: "2.circle.fill"))*/
        firstNavController.tabBarItem = UITabBarItem(title: "첫번째", image: UIImage(systemName: "1.circle"), tag: 0)
        
        secondNavController.tabBarItem = UITabBarItem(title: "두번째", image: UIImage(systemName: "2.circle"), tag: 1)
    }
    
}

#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
