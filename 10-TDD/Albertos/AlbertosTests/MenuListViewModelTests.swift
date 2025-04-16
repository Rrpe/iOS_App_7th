//
//  MenuListViewModelTests.swift
//  AlbertosTests
//
//  Created by KimJunsoo on 4/16/25.
//

@testable import Albertos
import XCTest
import Combine

final class MenuListViewModelTests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()
    
    // 메뉴 리스트 첫 Publisher 는 빈 리스트를 발행한다.
    func testWhenFetchingStartsPublishesEmptyMenu() throws {
        // Arrange
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingStub(returning: .success([])))
        
        // Act
        let sections = try viewModel.sections.get()
        
        // Assert
        XCTAssertTrue(sections.isEmpty)
    }
    
    // 메뉴 리스트 조회가 성공하면, 메뉴를 그룹화하는 클로저를 사용하여 섹션을 생성한다.
    func testWhenFecthingSucceedsPublishesSectionsBuiltFromReceivedMenuAndGivenGroupingClosure() {
        var receivedMenu: [MenuItem]?
        
        let expectedSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            receivedMenu = items
            return expectedSections
        }
        let expectedMenu = [MenuItem.fixture()]
        
        let viewModel = MenuList.ViewModel(
            menuFetching: MenuFetchingStub(returning: .success(expectedMenu)),
            menuGrouping: spyClosure
        )
        
        let expectation = XCTestExpectation(description: "Publishes sections built from received menu and given grouping closure")
        
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                guard case .success(let sections) = value else {
                    return XCTFail("Expected a successful Result, got: \(value)")
                }
                // Ensure the grouping closure is called with the
                // received menu
                XCTAssertEqual(receivedMenu, expectedMenu)
                // Ensure the published value is the result of the
                // grouping closure
                XCTAssertEqual(sections, expectedSections)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
    }
    
    // 메뉴 리스트 조회가 실패하면, 에러를 발행한다.
    func testWhenFetchingFailsPublishesAnError() {
        // Arrange
        let expectedError = NSError(domain: "test", code: 0, userInfo: [NSLocalizedDescriptionKey: "Test error"])
        let viewModel = MenuList.ViewModel(
            menuFetching: MenuFetchingStub(returning: .failure(expectedError))
        )
        
        // Act & Assert
        let expectation = XCTestExpectation(description: "Publishes error when fetching fails")
        
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                guard case .failure(let error) = value else {
                    return XCTFail("Expected a failure Result, got: \(value)")
                }
                let nsError = error as NSError
                XCTAssertEqual(nsError, expectedError)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // retry 메서드를 호출하면 메뉴를 다시 가져온다.
    func testRetryFetchesMenuAgain() {
        // Arrange
        let expectedError = NSError(domain: "test", code: 0, userInfo: [NSLocalizedDescriptionKey: "Test error"])
        let menuFetchingStub = MenuFetchingStub(returning: .failure(expectedError))
        let spyMenuFetching = SpyMenuFetching(returning: menuFetchingStub.result)
        
        let viewModel = MenuList.ViewModel(
            menuFetching: spyMenuFetching
        )
        
        // Act
        let initialCallCount = spyMenuFetching.fetchMenuCallCount
        viewModel.retry()
        
        // Assert
        XCTAssertEqual(spyMenuFetching.fetchMenuCallCount, initialCallCount + 1)
    }
}

// 호출 횟수를 기록하는 Spy 객체
class SpyMenuFetching: MenuFetching {
    private let menuFetching: MenuFetching
    private(set) var fetchMenuCallCount = 0
    
    init(returning result: Result<[MenuItem], Error>) {
        self.menuFetching = MenuFetchingStub(returning: result)
    }
    
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        fetchMenuCallCount += 1
        return menuFetching.fetchMenu()
    }
}
