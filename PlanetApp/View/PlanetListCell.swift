//
//  PlanetListCell.swift
//  PlanetApp
//
//  Created by Yves Dukuze on 11/05/2023.
//

import SwiftUI

struct PlanetListCell: View {
    let planet: PlanetEntity
    
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            VStack(alignment: .leading) {
                Text(planet.name ?? "")
                Text(planet.diameter ?? "")
            }
        }
        .padding()
    }
}

struct PlanetListCell_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetailView(planet: Result.MockedContext()[0])
    }
}
