//
//  PlanetListUseCase.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import Foundation
import CoreData

protocol PlanetListUseCase {
    func getDataForPlanets(urlString: String, context: NSManagedObjectContext) async
}
