//
//  MenuFetchingPlaceholder.swift
//  Albertos
//
//  Created by KimJunsoo on 4/16/25.
//


import Foundation
import Combine

class MenuFetchingPlaceholder: MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        return Future { $0(.success(menu)) }
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
