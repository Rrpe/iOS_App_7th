//
//  Publisher+retry.swift
//  CombineDemo
//
//  Created by KimJunsoo on 4/8/25.
//

import Foundation
import Combine

extension Publisher where Failure == Error {
    func retry() -> AnyPublisher<Output, Failure> {
        self
            .catch { error in
                if case APIError.serverError(_, _, let retryAfter) = error {
                    let delayTime = retryAfter > 0 ? TimeInterval(retryAfter) : 0.1
                    return Just(())
                        .delay(for: .seconds(delayTime), scheduler: RunLoop.main)
                        .flatMap { _ in
                            return self
                        }
                        .retry(10)
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
