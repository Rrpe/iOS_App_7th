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
    
    func testCallsGivenGroupingFunction() throws {
        // 테스트 코드를 사용하지 않는 경우, Skip 을 활용할 수 있다.
        try XCTSkipIf(true, "skipping this for now, keeping it to reuse part of the code later on")
        var called = false
        let inputSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            called = true
            return inputSections
        }
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder(),
                                           menuGrouping: spyClosure)
        let sections = viewModel.sections
        // 주어진 클로저가 호출되었는지 확인합니다.
        XCTAssertTrue(called)
        
    }
    
}
