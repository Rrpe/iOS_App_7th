//
//  CustomViewController.swift
//  DelegateDemo
//
//  Created by KimJunsoo on 3/13/25.
//

import UIKit

protocol CustomViewControllerDelegate: AnyObject {
    func didTapButton(withText text: String)
    
    func willAppear()
}

extension CustomViewControllerDelegate {
    func willAppear() {
        
    }
}

class CustomViewController: UIViewController {
    
    weak var delegate: CustomViewControllerDelegate?
    
    private let textField = UITextField()
    private let actionButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        delegate?.willAppear()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        // 텍스트 필드 설정
        textField.borderStyle = .roundedRect
        textField.placeholder = "여기에 텍스트 입력"
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        // 버튼 설정
        actionButton.setTitle("전송", for: .normal)
        actionButton.addAction(UIAction { _ in
            self.buttonTapped()
        }, for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actionButton)
        
        // 제약조건 설정
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            textField.widthAnchor.constraint(equalToConstant: 250),
            
            actionButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func buttonTapped() {
        // 버튼이 탭되면 델리게이트에게 알립니다
            let text = textField.text ?? ""
            delegate?.didTapButton(withText: text)
    }
}
