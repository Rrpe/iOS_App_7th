//
//  WeatherData.swift
//  WidgetDemo
//
//  Created by KimJunsoo on 1/22/25.
//

import Foundation
import WidgetKit

struct WeatherEntry: TimelineEntry {
    var date: Date
    let city: String
    let temperature: Int
    let description: String
    let icon: String
    let image: String
}

let londonTimeline = [
    WeatherEntry(date: Date(), city: "London", temperature: 87,
                 description: "Hail Storm", icon: "cloud.hail",
                 image: "hail"),
    WeatherEntry(date: Date(), city: "London", temperature: 92,
                 description: "Thunder Storm", icon: "cloud.bolt.rain",
                 image: "thunder"),
    WeatherEntry(date: Date(), city: "London", temperature: 95,
                 description: "Hail Storm", icon: "cloud.hail",
                 image: "hail")
]
let miamiTimeline = [
    WeatherEntry(date: Date(), city: "Miami", temperature: 85,
                 description: "Sunny", icon: "sun.max.fill",
                 image: "sunny"),
    WeatherEntry(date: Date(), city: "Miami", temperature: 90,
                 description: "Rainy", icon: "cloud.rain.fill",
                 image: "rainy"),
    WeatherEntry(date: Date(), city: "Miami", temperature: 88,
                 description: "Partly Cloudy", icon: "cloud.sun.fill",
                 image: "partlyCloudy")
]
