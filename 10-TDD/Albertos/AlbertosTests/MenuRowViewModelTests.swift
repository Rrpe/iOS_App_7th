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
        let inputSections: [MenuSection] = [.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            called = true
            return inputSections
        }
        let menuItems: [MenuItem] = inputSections.flatMap { $0.items }
        let viewModel = MenuList.ViewModel(
            menuFetching: MenuFetchingStub(returning: .success(menuItems)),
            menuGrouping: spyClosure
        )
        let sections = try viewModel.sections.get()
        XCTAssertTrue(called)
        // 반환된 값이 클로저를 통해서 생성된 값이 맞는지 확인합니다.
        XCTAssertEqual(sections, inputSections)
    }
}
