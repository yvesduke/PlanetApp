//
//  PlanetAppApp.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import SwiftUI

@main
struct PlanetAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PlanetListViewModel(repository: PlanetRepositoryImpl(networkManager: NetworkManger())), isErrorOccured: false)
        }
    }
}
