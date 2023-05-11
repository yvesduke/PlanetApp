//
//  MockedNetworkManagerTests.swift
//  PlanetAppTests
//
//  Created by Yves Dukuze on 11/05/2023.
//

import Foundation
@testable import PlanetApp
import XCTest

class MockedNetworkManagerTests: XCTestCase {
    
    func testGetDataFromAPI_Success() async throws {
        // Given
        let mockedNetworkManager = MockedNetworkManager()
        let repo = PlanetRepositoryImpl(networkManager: mockedNetworkManager)
        let url = URL(string: "productData")!
        
        // When
        let data = try await repo.getPlanets(for: url)
        
        // Then
        XCTAssertNotNil(data, "Data Should not be nil")
    }
    
    func testGetDataFromAPI_DataNotFound() async throws {
        // Given
        let mockedNetworkManager = MockedNetworkManager()
        let repo = PlanetRepositoryImpl(networkManager: mockedNetworkManager)
        let url = URL(string: "invalidPath")!
        
        // When
        do {
            let _ = try await repo.getPlanets(for: url)
            XCTFail("Expected an error to be thrown")
        } catch let error as NetworkError {
            // Then
            XCTAssertEqual(error, NetworkError.dataNotFound, "Error should be dataNotFound")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
