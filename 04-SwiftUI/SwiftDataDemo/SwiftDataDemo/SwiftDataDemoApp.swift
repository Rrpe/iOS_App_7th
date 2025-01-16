//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by KimJunsoo on 1/16/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    // ModelContainer : 앱의 스키마와 영구 저장소 관리를 위한 객체
    var sharedModelContainer: ModelContainer = {
        // Schema : 모델 클래스와 모델 저장소의 데이터를 매핑하며, 데이터 마이그레이션을 돕는 객체.
        let schema = Schema([
            Product.self,
        ])
        // ModelConfiguration : 데이터가 영구 저장소에 저장될지, 메모리에만 저장될지 설정
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // 앱의 모든 뷰에 동일하게 ModelContainer를 공유할 수 있게 설정해줌
        .modelContainer(sharedModelContainer)
    }
}
