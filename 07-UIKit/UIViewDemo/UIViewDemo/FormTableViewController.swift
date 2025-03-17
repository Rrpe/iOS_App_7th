//
//  FormTableViewController.swift
//  UIViewDemo
//
//  Created by KimJunsoo on 3/13/25.
//

import UIKit

class FormTableViewController: UITableViewController {
    var flag = false
    let toggle = UISwitch()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = .black
        
        setupUI()
    }
    
    func setupUI() {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // section을 4개만 나오게
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        /*switch section {
        case 0: // 0번째 section은 1줄
            return 1
        case 3: // 3번째 section은 3줄
            return 3
        default: // 나머지 section은 2줄
            return 2
        }*/
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Header"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Section Footer"
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        // 테이블 뷰 생성
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        // 셀에 추가된 서브 뷰 제거
        cell.subviews.forEach { $0.removeFromSuperview() }
        
        if indexPath.row == 0 {
            
        }
        
        // Configure the cell...
        var config = UIListContentConfiguration.subtitleCell()
        config.text = "Section: \(indexPath.section), Row: \(indexPath.row)"
        cell.contentConfiguration = config
        
//        cell.backgroundColor = .systemGray

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /*switch indexPath.section {
        case 0:
            return 100.0
        case 1:
            return 200.0
        default:
            return 50.0
        }*/
        return 50.0
    }
}

#Preview {
    FormTableViewController(style: .insetGrouped)
}
