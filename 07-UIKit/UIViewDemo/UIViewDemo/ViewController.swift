//
//  ViewController.swift
//  UIViewDemo
//
//  Created by KimJunsoo on 3/13/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStackView()
    }

    func setupStackView() {
        
        // 레이블 생성
        let label1 = UILabel()
        label1.backgroundColor = .systemRed
        label1.text = "Label 1"
        
        let label2 = UILabel()
        label2.backgroundColor = .systemBlue
        label2.text = "Label 2"
        
        let label3 = UILabel()
        label3.backgroundColor = .systemGreen
        label3.text = "Label 3"
        
//        stackView.addArrangedSubview(label1)
//        stackView.addArrangedSubview(label2)
//        stackView.addArrangedSubview(label3)
        
        let stackView = UIStackView(arrangedSubviews: [label1, label2, label3])
        stackView.backgroundColor = .systemGray
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

