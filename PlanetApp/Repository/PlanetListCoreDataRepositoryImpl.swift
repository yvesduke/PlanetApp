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
        return []
    }
    
}
