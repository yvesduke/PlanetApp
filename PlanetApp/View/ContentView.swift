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

    var body: some View {
        
        NavigationStack {
            VStack {
                if viewModel.error != nil {
                    ProgressView().alert(isPresented: $isErrorOccured){
                        Alert(title: Text(viewModel.error?.localizedDescription ?? "Error Occured"),message: Text("Something went wrong"), dismissButton: .default(Text("Ok")))
                    }
                } else {
                    List{
                        ForEach(viewModel.planets, id: \ .id){ planet in
                            NavigationLink{
//                                EmptyView()
                                PlanetDetailView(planet: planet)
                            }label: {
                                VStack{
//                                    Text("Name: \(planet.name ?? "")")
//                                    Text("Diameter: \(planet.diameter ?? "")")
                                    PlanetListCell(planet: planet)
                                }
                            }
                        }
                    }.padding()
                }
            }.task {
                await viewModel.getDataForPlanets(urlString: APIEndPoint.planetEndpoint)
                if viewModel.error != nil {
                    isErrorOccured =  true
                }
            }.refreshable {
                await viewModel.getDataForPlanets(urlString: APIEndPoint.planetEndpoint)
                if viewModel.error != nil {
                    isErrorOccured =  true
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
