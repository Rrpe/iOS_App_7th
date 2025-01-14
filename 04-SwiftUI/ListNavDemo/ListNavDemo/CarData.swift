//
//  CarData.swift
//  ListNavDemo
//
//  Created by KimJunsoo on 1/14/25.
//

import Foundation

var carData: [Car] = loadJson("carData.json")

func loadJson<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName).json")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName).json: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        return result
    } catch {
        fatalError("Unable to parse \(fileName).json: \(error)")
    }
}
