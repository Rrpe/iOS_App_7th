//
//  WeatherWidgetBundle.swift
//  WeatherWidget
//
//  Created by KimJunsoo on 1/22/25.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget()
        WeatherWidgetControl()
        WeatherWidgetLiveActivity()
    }
}
