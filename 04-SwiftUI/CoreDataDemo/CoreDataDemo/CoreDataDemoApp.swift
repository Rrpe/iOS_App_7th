//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by KimJunsoo on 1/16/25.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    // PersistenceController : CoreData의 저장소를 관리하는 역할
    // .shared : 싱글턴 인스턴스를 사용하여 앱 전체 영구 저장소를 관리
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
            // environment :  CoreData 컨텍스트를 뷰 계층에 전달
            // managerdObjectContext : CoreData에서 데이터를 읽고 쓰기 위한 작업 제공
            // viewContext : SwiftUI, UIKit에서 데이터를 표시하거나 업데이트 할 때 사용
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
