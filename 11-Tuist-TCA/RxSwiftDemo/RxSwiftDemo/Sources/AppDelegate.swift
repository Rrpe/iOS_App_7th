//
//  AppDelegate.swift
//  RxSwiftDemo
//
//  Created by KimJunsoo on 4/22/25.
//

import UIKit
import RxSwift
import RxCocoa

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // RxCocoa 초기화 및 DelegateProxy 설정
//        _ = RxCocoa.setup()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = SearchViewController()
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()
        return true
    }
}
