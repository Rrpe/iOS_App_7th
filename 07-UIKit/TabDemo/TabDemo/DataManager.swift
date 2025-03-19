//
//  DataManager.swift
//  TabDemo
//
//  Created by KimJunsoo on 3/19/25.
//

import UIKit

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    var data: String = ""
    
    static let dataChangedNotification = Notification.Name("DataChangedNotification")
    
    func updateData(_ newData: String) {
        data = newData
        NotificationCenter.default.post(name: DataManager.dataChangedNotification, object: nil)
    }
}
