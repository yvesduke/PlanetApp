//
//  PlanetListCoreDataRepositoryImpl.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 12/05/2023.
//

import Foundation
import CoreData

class PlanetListCoreDataRepositoryImpl: PlanetListCoreDataRepository{

    var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func savePlanetList(planets: [Result]) async throws {
        planets.forEach{ planet in
            let entity = PlanetEntity(context: context)
            entity.climate = planet.climate
            entity.diameter = planet.diameter
            entity.gravity = planet.gravity
            entity.id = planet.id
            entity.orbitalPeriod = planet.orbitalPeriod
            entity.population = planet.population
            entity.rotationPeriod = planet.rotationPeriod
            entity.surfaceWater = planet.surfaceWater
            entity.terrain = planet.terrain
            entity.url = planet.url
            entity.name = planet.name
        }
        do{
            try context.save()
        }catch let error{
            print(error.localizedDescription)
            throw CoreDataError.savingError
        }
    }

    func getPlanetListFromDb(planets: [Result]) async throws -> [PlanetEntity] {

        let fetchRequest: NSFetchRequest<PlanetEntity>
        fetchRequest = PlanetEntity.fetchRequest()
        let planets = try context.fetch(fetchRequest)
    
        return planets
    }

}
