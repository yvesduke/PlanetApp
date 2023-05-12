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
                            NavigationLink{
                                PlanetDetailView(planet: planetEntity)
                            }label: {
                                VStack{
                                    PlanetListCell(planet: planetEntity)
                                }
                            }
                        }
                    }.padding()
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
