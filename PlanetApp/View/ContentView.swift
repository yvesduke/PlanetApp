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
    
    var body: some View {

        NavigationStack {
            VStack {
                if viewModel.planetsDb.isEmpty {
                    ProgressView().onAppear{
                        Task{
                            await viewModel.getDataForPlanets(urlString: APIEndPoint.planetEndpoint, context: context)
                            if viewModel.error != nil{
                                isErrorOccured = true
                            }
                        }
                    }
                    List{
                        ForEach(viewModel.planets, id: \.id){ remotePlanet in
                            NavigationLink{
                                PlanetDetailView(dbPlanet: nil, remotePlanet: remotePlanet)
                            }label: {
                                VStack{
                                    PlanetListCell(dbPlanet: nil, remotePlanet: remotePlanet)
                                }
                            }
                        }
                    }.padding()
                } else if viewModel.error != nil {
                    ProgressView().alert(isPresented: $isErrorOccured){
                        Alert(title: Text(viewModel.error?.localizedDescription ?? "Error Occured"),message: Text("Something went wrong"),
                              dismissButton: .default(Text("Ok")))
                    }
                } else {
                    List{
                        ForEach(viewModel.planetsDb){ planetEntity in
                            NavigationLink{
                                PlanetDetailView(dbPlanet: planetEntity, remotePlanet: nil)
                            }label: {
                                VStack{
                                    PlanetListCell(dbPlanet: planetEntity, remotePlanet: nil)
                                }
                            }
                        }
                    }.padding()
                }
            }
            .task {
                await viewModel.getDataFromDb(context: context)
                if viewModel.dbError != nil{
                    isErrorOccured = true
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
