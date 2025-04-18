//
//  PaymentProcessing.swift
//  Albertos
//
//  Created by KimJunsoo on 4/18/25.
//

import Combine

protocol PaymentProcessing {
    func process(for order: Order) -> AnyPublisher<Void, Error>
}
