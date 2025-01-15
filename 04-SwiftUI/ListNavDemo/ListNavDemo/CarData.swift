//
//  CarData.swift
//  ListNavDemo
//
//  Created by KimJunsoo on 1/14/25.
//

import Foundation

// JSON 파일에서 로드한 Car 배열을 저장하는 전역 변수
var defaultCarData: [Car] = loadJsonFromBundle( "carData.json")

// 내 문서의 파일에서 가져오기 한 후, nil 이면 기본 번들 데이터 사용
var carData: [Car] = loadJsonFromDocuments() ?? defaultCarData

// 내 문서의 파일로부터 Car 배열을 가져오는 함수 [ 파일이 없거나, 디코드 되지 않으면 nil ]
func loadJsonFromDocuments() -> [Car]? {
    let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    let fileURL = documentURL.appendingPathComponent("carData.json")
    guard FileManager.default.fileExists(atPath: fileURL.path) else { return nil }
    
    do {
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let result = try decoder.decode([Car].self, from: data)
        return result
    } catch {
        print("Unable to decode \(fileURL): \(error)")
        return nil
    }
}

func loadJsonFromBundle<T: Decodable>(_ fileName: String) -> T {
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


func saveJsonToDocuments(_ data: [Car]) {
    let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    let fileURL = documentURL.appendingPathComponent("carData.json")
    
    do {
        let encoder = JSONEncoder()
        let encodedData = try encoder.encode(data)
        try encodedData.write(to: fileURL, options: [.atomic])
        print("Save Success!")
    } catch {
        print("Failed to save : \(error)")
    }
}
