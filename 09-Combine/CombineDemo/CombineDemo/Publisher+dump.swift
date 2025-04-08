//
//  Publisher+dump.swift
//  CombineDemo
//
//  Created by KimJunsoo on 4/8/25.
//

import Foundation
import Combine

extension Publisher {
    func dump() -> AnyPublisher<Self.Output, Self.Failure> {
        handleEvents(receiveOutput: { value in
            Swift.dump(value)
        })
        .eraseToAnyPublisher()
    }
}
