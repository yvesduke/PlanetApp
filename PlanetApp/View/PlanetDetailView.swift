//
//  PlanetDetailView.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import SwiftUI

struct PlanetDetailView: View {
    
//    var planet: Result
    var planet: PlanetEntity
    
    var body: some View {
        VStack {
            Text(planet.name ?? "")
                .foregroundColor(.gray)
                .font(.headline)
            Divider()
            Text(planet.terrain ?? "")
            Divider()
            Text(planet.climate ?? "")
            Divider()
            Text(planet.population ?? "")
        }
//        Spacer()
    }
}

struct PlanetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetailView(planet: Result.MockedContext()[0])
    }
}
