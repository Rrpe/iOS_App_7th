//
//  CarStore.swift
//  ListNavDemo
//
//  Created by KimJunsoo on 1/14/25.
//

import SwiftUI

@Observable
class CarStore {
    var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
