//
//  ContentView.swift
//  UFCExplorer
//
//  Created by Daniele Cavalcante on 16/05/22.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -3.745089, longitude: -38.575881), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    let locations = [
        Location(name: "RU Novo", coordinate: CLLocationCoordinate2D(latitude: -3.747778, longitude: -38.577055)),
        Location(name: "RU Antigo", coordinate: CLLocationCoordinate2D(latitude: -3.744832, longitude: -38.572789))
    ]
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) {
                location in MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 1)
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .navigationTitle("UFC")
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
