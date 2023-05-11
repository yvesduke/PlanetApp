//
//  NetworkManager.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import Foundation

protocol Networkable {
    func getDataFromAPI(url: URL) async throws -> Data
}

class NetworkManger: Networkable {
    func getDataFromAPI(url: URL) async throws -> Data {
        do {
           let (data,_)  = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
