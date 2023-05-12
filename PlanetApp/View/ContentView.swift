//
//  ContentView.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var viewModel: PlanetListViewModel
    @State var isErrorOccured: Bool
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: PlanetEntity.entity(), sortDescriptors: [])
    var dbPlanetArray: FetchedResults<PlanetEntity>
    var fetchRequest: NSFetchRequest<PlanetEntity> = PlanetEntity.fetchRequest()

    var body: some View {
        NavigationStack {
//            VStack {
//                if viewModel.error != nil {
//                } else {
//                    List{
//                        ForEach(viewModel.planets, id: \ .id){ planet in
//                            NavigationLink{
//                                PlanetDetailView(planet: planet)
//                            }label: {
//                                VStack{
//                                    PlanetListCell(planet: planet)
//                                }
//                            }
//                        }
//                    }.padding()
//                }
//            }.task {
//                await viewModel.getDataForPlanets(urlString: APIEndPoint.planetEndpoint)
//                if viewModel.error != nil {
//                    isErrorOccured =  true
//                }
//            }.refreshable {
//                await viewModel.getDataForPlanets(urlString: APIEndPoint.planetEndpoint)
//                if viewModel.error != nil {
//                    isErrorOccured =  true
//                }
//            }
            
            VStack {
                
                if dbPlanetArray.isEmpty {
                    ProgressView().onAppear{
                        Task{
                            await viewModel.getDataForPlanets(urlString: APIEndPoint.planetEndpoint, context: context)
                        }
                    }
                } else {
                    List{
                        ForEach(dbPlanetArray){ planetEntity in
                            Text(planetEntity.name ?? "")
                        }
                    }
                }
                
            }
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PlanetListViewModel(repository: PlanetRepositoryImpl(networkManager: NetworkManger())), isErrorOccured: false)
    }
}
