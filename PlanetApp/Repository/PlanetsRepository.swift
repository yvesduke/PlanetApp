//
//  PlanetsRepository.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import Foundation

protocol PlanetsListRepository {
    func getPlanets(for url:URL) async throws -> PlanetData
}
