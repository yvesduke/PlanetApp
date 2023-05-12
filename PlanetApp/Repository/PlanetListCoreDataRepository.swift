//
//  PlanetListCoreDataRepository.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 12/05/2023.
//

import Foundation

protocol PlanetListCoreDataRepository{
    
    func savePlanetList(planets:[Result]) async throws
    func getPlanetListFromDb(planets:[Result]) async throws -> [PlanetEntity]
    
}
