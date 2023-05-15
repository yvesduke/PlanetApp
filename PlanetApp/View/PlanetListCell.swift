//
//  PlanetListCell.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import SwiftUI

struct PlanetListCell: View {
    let dbPlanet: PlanetEntity?
    let remotePlanet: Result?
    
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            VStack(alignment: .leading) {
                dbPlanet?.name != nil ? Text(dbPlanet?.name ?? "") : Text(remotePlanet?.name ?? "")
                dbPlanet?.diameter != nil ? Text(dbPlanet?.diameter ?? "") : Text(remotePlanet?.diameter ?? "")
            }
        }
        .padding()
    }
}

struct PlanetListCell_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetailView(dbPlanet: nil, remotePlanet: Result.MockedPlanets()[0])

    }
}
