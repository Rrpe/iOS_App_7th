//
//  SceneDelegate.swift
//  SnapKitDemo
//
//  Created by KimJunsoo on 4/22/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ProductDetailViewController())
        window?.makeKeyAndVisible()
        return true
    }
}
