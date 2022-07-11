//
//  Services.swift
//  MercadoLibreTestTests
//
//  Created by Esteban Monsalve on 11/07/22.
//

import XCTest
@testable import MercadoLibreTest

class Services: XCTestCase {
    
    private lazy var apiManager = APIManager()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearchService() {
        let serviceExpectation = expectation(description: "\(EndPoint.search.path)")
        let parameters = MatchesItemsRequest(query: "iphone", limit: 8, category: nil)
        apiManager.request(
            parameters: parameters,
            endpoint: .search
        ) { (result: Result<MatchesItemsResponse>) in
            switch result {
            case .success:
                XCTAssert(true)
            case .error(let error):
                XCTFail(error.asAFError?.failureReason ?? "")
            }
            serviceExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("exceeded timeout: \(error)")
            }
        }
    }
    
    func testSearchWithCategoryService() {
        let serviceExpectation = expectation(description: "\(EndPoint.search.path)")
        let parameters = MatchesItemsRequest(query: "iphone", limit: 8, category: "MCO1055")
        apiManager.request(
            parameters: parameters,
            endpoint: .search
        ) { (result: Result<MatchesItemsResponse>) in
            switch result {
            case .success:
                XCTAssert(true)
            case .error(let error):
                XCTFail(error.asAFError?.failureReason ?? "")
            }
            serviceExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("exceeded timeout: \(error)")
            }
        }
    }
    
    func testProductDetailService() {
        let serviceExpectation = expectation(description: "\(EndPoint.productDetail(productId: "MCO892308758").path)")
        apiManager.request(
            parameters: EmptyRequest(),
            endpoint: .productDetail(productId: "MCO892308758")
        ) { (result: Result<ItemResponse>) in
            switch result {
            case .success:
                XCTAssert(true)
            case .error(let error):
                XCTFail(error.asAFError?.failureReason ?? "")
            }
            serviceExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("exceeded timeout: \(error)")
            }
        }
    }

}
