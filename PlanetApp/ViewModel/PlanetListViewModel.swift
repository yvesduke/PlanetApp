//
//  PlanetListViewModel.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import Foundation
import CoreData

@MainActor
class PlanetListViewModel: ObservableObject {

    @Published var planets: [Result] = []
    @Published var planetsDb:[PlanetEntity] = []
    @Published var error: NetworkError?
    @Published var dbError: CoreDataError?

    private var coreDataRepository: PlanetListCoreDataRepository?
    private let repository: PlanetsListRepository

    init(repository: PlanetsListRepository) {
        self.repository = repository
    }
}

extension PlanetListViewModel: PlanetListUseCase{

    func getDataForPlanets(urlString: String, context: NSManagedObjectContext) async {
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.error = .invalidURL
            }
            return
        }
        do {
            let planetData = try await repository.getPlanets(for: url)
            await self.saveDataIntoDB(context: context)
            DispatchQueue.main.async {
                self.planets = planetData.results
                self.error = nil
            }
        } catch {
            DispatchQueue.main.async {
                self.error = NetworkError.dataNotFound
            }
        }
    }
    
    private func saveDataIntoDB(context:NSManagedObjectContext) async {
        do{
            try await coreDataRepository?.savePlanetList(planets: planets)
//            print("DB Saved successfully")
            DispatchQueue.main.async {
                self.dbError = nil
            }
        }catch{
//           print("DB Save Failed")
            self.dbError = CoreDataError.savingError
        }
    }
    
    func getDataFromDb(context: NSManagedObjectContext) async {
        do {
            coreDataRepository = PlanetListCoreDataRepositoryImpl(context: context)
            if let planets = try await coreDataRepository?.getPlanetListFromDb() {
//                print("DB retrieved successfully")
                DispatchQueue.main.async {
                    self.planetsDb = planets
                    self.dbError = nil
                }
            }
        } catch {
//            print("DB fetch Failed")
            self.dbError = CoreDataError.gettingError
        }
    }

}
