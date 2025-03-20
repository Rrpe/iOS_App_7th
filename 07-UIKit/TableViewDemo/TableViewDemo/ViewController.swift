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

struct AnimalCategory {
    let category: String
    let animals: [Animal]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let categories = [
        AnimalCategory(category: "포유류", animals: [
          Animal(name: "사자", image: UIImage(systemName: "cat")!),
          Animal(name: "호랑이", image: UIImage(systemName: "cat")!),
          Animal(name: "곰", image: UIImage(systemName: "pawprint")!)
        ]),
        AnimalCategory(category: "조류", animals: [
          Animal(name: "독수리", image: UIImage(systemName: "bird")!),
          Animal(name: "부엉이", image: UIImage(systemName: "bird")!),
          Animal(name: "참새", image: UIImage(systemName: "bird")!)
        ]),
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    }
    
    // MARK: - UITableViewDataSource
    
    // 섹션의 개수 반환
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    // 섹션별 행 수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].animals.count
    }
    
    // 각 행에 표시할 셀 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        // 재사용 가능한 셀이 없으면 새로 생성
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell") // style: .default, .subtitle, .value1, .value2
        }
        // 셀의 텍스트 레이블에 이름 표시
        cell?.textLabel?.text = categories[indexPath.section].animals[indexPath.row].name
        
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    // 행이 선택되었을 때 호출
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행: \(indexPath.row)")
    }
    
    // 행의 높이를 반환
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // 행이 그려지기 직전에 호출
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.backgroundColor = indexPath.row % 2 == 0 ? .systemBackground : .secondarySystemBackground
    }
    
    // 헤더 뷰를 반환
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].category
    }
}

#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
