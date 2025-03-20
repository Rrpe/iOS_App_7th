//
//  SecondViewController.swift
//  TabDemo
//
//  Created by KimJunsoo on 3/19/25.
//

import UIKit

class SecondViewController: UIViewController {

    // 데이터를 표시할 레이블 생성 (속성 초기화 클로저 사용)
    /// 속성 초기화 클로저 (Property Initializer Closure)
    /// let dataLabel: UILabel = { ... }()와 같이 속성을 선언하면서 초기화 코드를 실행할 수 있습니다.
    /// 복잡한 UI 구성 요소 초기화에 유용하며, 코드를 더 깔끔하게 유지할 수 있습니다.
    let dataLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "데이터가 없습니다."
        return label
    }()
    
    // NotificationCenter 옵저버 변수 선언
    private var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Second"
        
        setupLabel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self) // 화면이 사라질 때 옵저버 제거
    }

    func setupLabel() {
        view.addSubview(dataLabel)
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dataLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        // NotificationCenter를 통해 데이터 변경 알림 구독
        /// 서로 다른 객체 간에 느슨하게 결합된 통신 방법을 제공합니다.
        /// 한 객체가 알림을 발송하면, 해당 알림을 구독하는 모든 객체가 그 알림을 받을 수 있습니다.
        /// addObserver(forName:object:queue:using:)으로 알림을 구독합니다.
        /// post(name:object:userInfo:)로 알림을 발송합니다.
        /// 메모리 관리를 위해 removeObserver(_:) 메서드로 불필요한 옵저버를 제거해야 합니다.
        observer = NotificationCenter.default.addObserver(forName: DataManager.dataChangedNotification, object: nil, queue: .main) { [weak self] _ in
            self?.updateLabel() // 알림이 오면 레이블 업데이트 함수 호출
        }
        
    }
    
    func updateLabel() {
        // 데이터 매니저에서 데이터 가져와 레이블 업데이트
        if DataManager.shared.data.isEmpty {
            dataLabel.text = "아직 데이터가 없습니다."
        } else {
            dataLabel.text = DataManager.shared.data
        }
    }
    
    deinit {
        // 객체가 메모리에서 해제될 때 옵저버 제거
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
