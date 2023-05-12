//
//  Planet.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.


import Foundation
import CoreData

// MARK: - Planet
struct PlanetData: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Hashable {
    
    static func == (lhs: Result, rhs: Result) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.rotationPeriod == rhs.rotationPeriod && lhs.orbitalPeriod == rhs.orbitalPeriod && lhs.diameter == rhs.diameter && lhs.climate == rhs.climate && lhs.gravity == rhs.gravity && lhs.terrain == rhs.terrain && lhs.surfaceWater == rhs.surfaceWater && lhs.population == rhs.population && lhs.residents == rhs.residents && lhs.films == rhs.films && lhs.created == rhs.created && lhs.edited == rhs.edited && lhs.url == rhs.url
    }
    
    let id = UUID()
    let name, rotationPeriod, orbitalPeriod, diameter: String?
    let climate, gravity, terrain, surfaceWater: String?
    let population: String?
    let residents, films: [String]?
    let created, edited: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

extension Result {
    static func MockedPlanets() -> [Result] {
        return [
            Result(name: "Tatooine", rotationPeriod: "23", orbitalPeriod: "304", diameter: "10465", climate: "arid", gravity: "1 standard", terrain: "desert", surfaceWater: "1", population: "200000", residents: [], films: [], created: "Monday", edited: "Tuesday", url: "https://google.com"),
            Result(name: "Yavin IV", rotationPeriod: "24", orbitalPeriod: "4818", diameter: "10200", climate: "temperate, tropical", gravity: "1 standard", terrain: "Jungle, rainforests", surfaceWater: "8", population: "1000", residents: [], films: [], created: "Friday", edited: "Sundayu", url: "https://google.com")
        ]
    }
    
    static func MockedContext() -> [PlanetEntity] {
        
        let context = NSManagedObjectContext()
        let entity = PlanetEntity(context: context)
        entity.climate = "planet climate"
        entity.diameter = "planet diameter"
        entity.gravity = "planet gravity"
        entity.id = UUID()
        entity.orbitalPeriod = "planet orbitalPeriod"
        entity.population = "planet population"
        entity.rotationPeriod = "planet rotationPeriod"
        entity.surfaceWater = "planet surfaceWater"
        entity.terrain = "planet terrain"
        entity.url = "planet url"
        entity.name = "planet name"
        
        return [
            PlanetEntity(context: context)
        ]
    }
}

