//
//  ViewController.swift
//  HelloWorld
//
//  Created by KimJunsoo on 3/12/25.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("01 ViewController.viewDidLoad()")
        
        setupUI()
    }
    
    func setupUI() {
        print("07 ViewController.setupUI()")
        let label = UILabel()
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        // frame layout
        label.frame = CGRect(x:20, y:100, width: view.frame.width - 40, height: 40)
        self.view.addSubview(label)
        
        let button = UIButton()
        button.setTitle("Go Second", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.frame = CGRect(x:20, y: 200, width: view.frame.width - 40, height: 40)
        button.addTarget(self, action: #selector(goSecond), for:.touchUpInside)
        
        self.view.addSubview(button)
    }
    
    func didDismissSecondViewController(message: String) {
        print("SecondViewController에서 전달받은 메시지: \(message)")
    }
    
    @objc func goSecond() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        self.present(secondVC, animated: true)
    }
}

