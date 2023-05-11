//
//  PlanetListUseCase.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import Foundation


protocol PlanetListUseCase {
    func getDataForPlanets(urlString: String) async
}
