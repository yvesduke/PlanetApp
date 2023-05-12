//
//  MockedNetworkManager.swift
//  PlanetAppTests
//
//  Created by Yves Dukuze on 11/05/2023.
//

import Foundation
@testable import PlanetApp
import XCTest

class MockedNetworkManager: Networkable {
    
    func getDataFromAPI(url: URL) async throws -> Data {
        do {
            let bundle = Bundle(for: MockedNetworkManager.self)
            guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}


