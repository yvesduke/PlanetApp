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
    @Published var error: NetworkError?

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
            self.planets = planetData.results
            self.error = nil
            await self.saveDataIntoDB(context: context)
        } catch {
            DispatchQueue.main.async {
                self.error = NetworkError.dataNotFound
            }
        }
    }
    
    private func saveDataIntoDB(context:NSManagedObjectContext) async {
        let coreDataRepository = PlanetListCoreDataRepositoryImpl(context: context)
        do{
            try await coreDataRepository.savePlanetList(planets: planets)
            print("DB Save successfully")
        }catch{
           print("DB Save Failed")
        }
    }

}
