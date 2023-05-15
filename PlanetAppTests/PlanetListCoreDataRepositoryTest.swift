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
        XCTAssertEqual(planets.first?.name, "Endor")
        XCTAssertEqual(planets.first?.climate, "temperate")
        XCTAssertEqual(planets.first?.terrain, "forests, mountains, lakes")
        XCTAssertEqual(planets.first?.diameter, "4900")
        XCTAssertEqual(planets.first?.gravity, "0.85 standard")
        XCTAssertEqual(planets.first?.orbitalPeriod, "402")
        XCTAssertEqual(planets.first?.rotationPeriod, "18")
        XCTAssertEqual(planets.first?.surfaceWater, "8")
        XCTAssertEqual(planets.first?.population, "30000000")
        XCTAssertEqual(planets.first?.url, "https://swapi.dev/api/planets/7/")
    }
    
    func testGetPlanetListFromDb() async throws {
        let result = try await repository.getPlanetListFromDb()
        XCTAssertEqual(result.first?.name, "Endor")
        XCTAssertEqual(result.first?.climate, "temperate")
        XCTAssertEqual(result.first?.terrain, "forests, mountains, lakes")
        XCTAssertEqual(result.first?.diameter, "4900")
        XCTAssertEqual(result.first?.gravity, "0.85 standard")
        XCTAssertEqual(result.first?.orbitalPeriod, "402")
        XCTAssertEqual(result.first?.rotationPeriod, "18")
        XCTAssertEqual(result.first?.surfaceWater, "8")
        XCTAssertEqual(result.first?.population, "30000000")
        XCTAssertEqual(result.first?.url, "https://swapi.dev/api/planets/7/")
    }
}
