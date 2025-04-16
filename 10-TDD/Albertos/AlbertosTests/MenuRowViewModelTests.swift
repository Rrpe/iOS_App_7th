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

    func testCallsGivenGroupingFunction() {
        var called = false
        let inputSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { item in
            called = true
            return inputSections
        }
        let viewModel = MenuList.ViewModel(menu: [.fixture()], menuGrouping: spyClosure)
        let sections = viewModel.sections
        // 주어진 클로저가 호출되었는지 확인합니다.
        XCTAssertTrue(called)
        // 반환된 값이 클로저로 생성된 값인지 확인합니다.
        XCTAssertEqual(sections, inputSections)
        
    }
    
}
