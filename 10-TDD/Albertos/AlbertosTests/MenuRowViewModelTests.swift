//
//  MenuRowViewModelTests.swift
//  AlbertosTests
//
//  Created by KimJunsoo on 4/16/25.
//

@testable import Albertos
import XCTest

final class MenuRowViewModelTests: XCTestCase {

    func testWhenItemIsNotSpicyTextIsItemNameOnly() {
        // Arrange
        let item: MenuItem = .fixture(name: "name", spicy: false)
        let viewModel = MenuRow.ViewModel(item: item)
        
        // Act
        
        // Assert
        XCTAssertEqual(viewModel.text, "name")
    }
    
    func testWhenItemIsSpicyTextIsItemNameWithChiliEmoji() {
        // Arrange
        let item: MenuItem = .fixture(name: "name", spicy: true)
        let viewModel = MenuRow.ViewModel(item: item)
        
        // Act
        
        // Assert
        XCTAssertEqual(viewModel.text, "name 🌶️")
    }

}
