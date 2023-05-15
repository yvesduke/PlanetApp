//
//  PlanetDetailView.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import SwiftUI

struct PlanetDetailView: View {

    let dbPlanet: PlanetEntity?
    let remotePlanet: Result?

    var body: some View {
        VStack {
            dbPlanet?.diameter != nil ? Text(dbPlanet?.diameter ?? "") : Text(remotePlanet?.diameter ?? "")
                .foregroundColor(.gray)
                .font(.headline)
            Divider()
            dbPlanet?.terrain != nil ? Text(dbPlanet?.terrain ?? "") : Text(remotePlanet?.terrain ?? "")
            Divider()
            dbPlanet?.climate != nil ? Text(dbPlanet?.diameter ?? "") : Text(remotePlanet?.diameter ?? "")
            Divider()
            dbPlanet?.population != nil ? Text(dbPlanet?.population ?? "") : Text(remotePlanet?.population ?? "")
        }
    }
}

struct PlanetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetailView(dbPlanet: nil, remotePlanet: Result.MockedPlanets()[0])
    }
}
