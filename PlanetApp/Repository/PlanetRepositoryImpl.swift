//
//  PlanetRepositoryImpl.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import Foundation

final class PlanetRepositoryImpl: PlanetsListRepository {

    let networkManager: Networkable

    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }

    func getPlanets(for url: URL) async throws -> PlanetData {
        let data = try await self.networkManager.getDataFromAPI(url: url)
        let planetData = try JSONDecoder().decode(PlanetData.self, from: data)
        return planetData
    }

}
