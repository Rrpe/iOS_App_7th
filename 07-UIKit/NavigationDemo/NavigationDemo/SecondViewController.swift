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
        
        let lefeButton = UIBarButtonItem(systemItem: .cancel, primaryAction: UIAction { [weak self] _ in
            self?.leftButtonTapped()
        })
        navigationItem.leftBarButtonItem = lefeButton
        
        let rightButton = UIBarButtonItem(title: "추가", primaryAction: UIAction { [weak self] _ in
            self?.rightButtonTapped()
        })
        
        let editButton = UIBarButtonItem(systemItem: .edit, primaryAction: UIAction { [weak self] _ in
            self?.editButtonTapped()
        })
        
        let searchButton = UIBarButtonItem(systemItem: .search, primaryAction: UIAction { [weak self] _ in
            self?.searchButtonTapped()
        })
        
        navigationItem.rightBarButtonItems = [rightButton, editButton, searchButton]
    }
    
    func leftButtonTapped() {
        print("왼쪽 버튼 클릭")
        self.navigationController?.popViewController(animated: true)
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
