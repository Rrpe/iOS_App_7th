//
//  ViewController.swift
//  TableViewDemo
//
//  Created by KimJunsoo on 3/19/25.
//

import UIKit

struct Animal {
    let name: String
    let image: UIImage
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    }
    
    // MARK: - UITableViewDataSource
    // 섹션별 행 수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    // 각 행에 표시할 셀 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        // 재사용 가능한 셀이 없으면 새로 생성
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell") // style: .default, .subtitle, .value1, .value2
        }
        // 셀의 텍스트 레이블에 이름 표시
        cell?.textLabel?.text = "Section \(indexPath.section), Row \(indexPath.row)"
        
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    // 행이 선택되었을 때 호출
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행: \(indexPath.row)")
    }
    
    // 행의 높이를 반환
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 100
        }
        return 60
    }
    
    // 행이 그려지기 직전에 호출
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = indexPath.row % 2 == 0 ? .systemBackground : .secondarySystemBackground
    }
    
}

#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
