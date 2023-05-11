//
//  PlanetListViewModel.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import Foundation

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

    func getDataForPlanets(urlString: String) async {
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.error = .invalidURL
            }
            return
        }
        do {
            let planetData = try await repository.getPlanets(for: url)
            planets = planetData.results
//            print(("================> : \(planets)"))
//            print(("================> ]]]] ===> : \(planetData)"))
            error = nil
        } catch {
            self.error = NetworkError.dataNotFound
        }
    }

}
