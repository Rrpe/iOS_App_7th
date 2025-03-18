//
//  ViewController.swift
//  MenuDemo
//
//  Created by KimJunsoo on 3/18/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI() {
        // 디폴트 버튼 설정
        var config = UIButton.Configuration.plain()
        
        // 밑줄 스타일
        let attributedTitle = AttributedString("애플")
        var container = AttributeContainer()
        container.underlineStyle = [.single]
        container.underlineColor = .blue
        container.font = .systemFont(ofSize: 50)
        
        let underlinedTitle = attributedTitle.settingAttributes(container)
        config.attributedTitle = underlinedTitle
        
        // 버튼 생성
        let button = UIButton(configuration: config)
        button.addAction(UIAction { [weak self] _ in
            print("버튼 클릭")
            // TODO: 버튼 클릭 이벤트 처리
            self?.openLink()
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func openLink() {
        if let url = URL(string: "https://www.apple.com"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url) { success in
                if success {
                    print("링크 열기 성공")
                } else {
                    print("링크 열기 실패")
                }
                
            }
        }
    }
    
}

