//
//  PlanetListCoreDataRepositoryTest.swift
//  PlanetAppTests
//
//  Created by Yves Dukuze on 12/05/2023.
//

import XCTest
import CoreData
@testable import PlanetApp

class PlanetListCoreDataRepositoryTests: XCTestCase {
    
    var repository: PlanetListCoreDataRepositoryImpl!
    var context: NSManagedObjectContext!
    
    override func setUpWithError() throws {
        let container = NSPersistentContainer(name: "PlanetApp")
        container.loadPersistentStores { _, error in
            XCTAssertNil(error)
        }
        context = container.viewContext
        repository = PlanetListCoreDataRepositoryImpl(context: context)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        try context.reset()
    }
    
    func testSavePlanetList() async throws {
        let planet = Result.MockedPlanets()[0]
        try await repository.savePlanetList(planets: [planet])
        let fetchRequest = NSFetchRequest<PlanetEntity>(entityName: "PlanetEntity")
        let planets = try context.fetch(fetchRequest)
        XCTAssertEqual(planets.first?.name, "Kamino")
        XCTAssertEqual(planets.first?.climate, "temperate")
        XCTAssertEqual(planets.first?.terrain, "ocean")
        XCTAssertEqual(planets.first?.diameter, "19720")
        XCTAssertEqual(planets.first?.gravity, "1 standard")
        XCTAssertEqual(planets.first?.orbitalPeriod, "463")
        XCTAssertEqual(planets.first?.rotationPeriod, "27")
        XCTAssertEqual(planets.first?.surfaceWater, "100")
        XCTAssertEqual(planets.first?.population, "1000000000")
        XCTAssertEqual(planets.first?.url, "https://swapi.dev/api/planets/10/")
    }
    
    func testGetPlanetListFromDb() async throws {
        let planet = Result.MockedPlanets()[0]
        try await repository.savePlanetList(planets: [planet])
        let result = try await repository.getPlanetListFromDb(planets: [planet])
        XCTAssertEqual(result.first?.name, "Kamino")
        XCTAssertEqual(result.first?.climate, "temperate")
        XCTAssertEqual(result.first?.terrain, "ocean")
        XCTAssertEqual(result.first?.diameter, "19720")
        XCTAssertEqual(result.first?.gravity, "1 standard")
        XCTAssertEqual(result.first?.orbitalPeriod, "463")
        XCTAssertEqual(result.first?.rotationPeriod, "27")
        XCTAssertEqual(result.first?.surfaceWater, "100")
        XCTAssertEqual(result.first?.population, "1000000000")
        XCTAssertEqual(result.first?.url, "https://swapi.dev/api/planets/10/")
    }
}
