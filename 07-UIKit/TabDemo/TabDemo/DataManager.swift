//
//  DataManager.swift
//  TabDemo
//
//  Created by KimJunsoo on 3/19/25.
//

import UIKit

class DataManager {
    // 싱글톤 인스턴스
    /// 싱글톤 패턴 - 전체 애플리케이션에서 단 하나의 인스턴스만 존재하는 클래스를 만드는 디자인 패턴입니다.
    /// 앱 전체에서 공유해야 하는 데이터나 설정을 관리하는 데 유용합니다.
    /// static let shared = DataManager()와 같이 정적 속성으로 단일 인스턴스를 제공합니다.
    /// private init()을 통해 외부에서 새 인스턴스를 생성하는 것을 방지합니다.
    static let shared = DataManager()
    
    // 초기화 메서드 (외부에서 인스턴스 생성 방지)
    private init() {}
    
    // 저장할 데이터 변수
    var data: String = ""
    
    // 데이터 변경 알림을 위한 Notification 이름
    static let dataChangedNotification = Notification.Name("DataChangedNotification")
    
    // 데이터 업데이트 메서드
    func updateData(_ newData: String) {
        data = newData
        // 데이터 변경 알림 발송
        NotificationCenter.default.post(name: DataManager.dataChangedNotification, object: nil)
    }
}
