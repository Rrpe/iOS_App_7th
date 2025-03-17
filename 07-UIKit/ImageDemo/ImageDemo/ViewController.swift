//
//  ViewController.swift
//  ImageDemo
//
//  Created by KimJunsoo on 3/17/25.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 기본 스크롤과 스택 뷰 추가
        setupUI()
        
        // 기본 도형 표시
        setupShapes()
    }
    
    // MARK: - UI설정
    func setupUI() {
        // 스크롤 뷰 설정
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // 스택 뷰 설정
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        // 제약조건 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    // MARK: - 기본 도형 표시
    func setupShapes() {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        // 컨테이너 뷰 제약 조건 활성화
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // 제목 레이블
        let titleLabel = UILabel()
        titleLabel.text = "1. 기본 도형"
        titleLabel.font = .systemFont(ofSize: 24)
//        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(titleLabel)
        
        // 원 만들기
        let circleView = UIView()
        let circleSize: CGFloat = 80
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = .yellow
        circleView.layer.cornerRadius = circleSize / 2
        circleView.layer.borderWidth = 2
        circleView.layer.borderColor = UIColor.black.cgColor
        containerView.addSubview(circleView)
        
        let squareView = UIView()
        let squareSize: CGFloat = 80
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .blue
        containerView.addSubview(squareView)
        
        NSLayoutConstraint.activate([
            // 제목 레이블 제약조건 설정
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            circleView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            circleView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            circleView.widthAnchor.constraint(equalToConstant: circleSize),
            circleView.heightAnchor.constraint(equalToConstant: circleSize),
            
            squareView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            squareView.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 30),
            squareView.widthAnchor.constraint(equalToConstant: squareSize),
            squareView.heightAnchor.constraint(equalToConstant: squareSize)
        ])
        
        // 스택 뷰에 컨테이너 뷰 추가
        stackView.addArrangedSubview(containerView)
    }
    
}

