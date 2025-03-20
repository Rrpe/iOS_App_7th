//
//  ViewController.swift
//  TableViewDemo
//
//  Created by KimJunsoo on 3/19/25.
//

import UIKit

// UIViewController를 상속받고 UITableViewDataSource 프로토콜을 구현하는 뷰 컨트롤러
class ViewController: UIViewController, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰 전체 영역에 테이블 뷰 생성, 스타일은 일반(.plain) 스타일로 지정
        let tableView = UITableView(frame: view.bounds, style: .plain)
        // 테이블 뷰의 데이터 소스를 현재 클래스(self)로 지정
        tableView.dataSource = self
        
        // 필수! 생성한 테이블 뷰를 뷰 컨트롤러의 메인 뷰에 추가
        view.addSubview(tableView)
    }
    
    // UITableViewDataSource 프로토콜 메서드 - 섹션별 행 수 반환
    /// 필수 구현 메서드:
    ///     1. tableView(_:numberOfRowsInSection:): 각 섹션에 표시할 행의 수를 반환합니다.
    ///     2. tableView(_:cellForRowAt:): 각 행에 표시할 셀을 구성하고 반환합니다.
    /// 선택적 메서드:
    ///     1. numberOfSections(in:): 테이블 뷰의 섹션 수를 반환합니다. 기본값은 1입니다.
    ///     2. tableView(_:titleForHeaderInSection:): 섹션 헤더의 제목을 반환합니다.
    ///     3. tableView(_:titleForFooterInSection:): 섹션 푸터의 제목을 반환합니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    // UITableViewDataSource 프로토콜 메서드 - 각 행에 표시할 셀 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용 가능한 셀을 큐에서 가져옴
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        // 재사용 가능한 셀이 없으면 새로 생성
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell") // style: .default, .subtitle, .value1, .value2
        }
        // 셀의 텍스트 레이블에 이름 표시
        cell?.textLabel?.text = "Section \(indexPath.section), Row \(indexPath.row)"
        // 설정된 셀 반환 (강제 언래핑)
        return cell!
    }
}

#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
