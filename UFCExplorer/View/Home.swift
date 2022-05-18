//
//  Home.swift
//  UFCExplorer
//
//  Created by Daniele Cavalcante on 17/05/22.
//

import SwiftUI
import CoreLocation

struct Home: View {
    @StateObject var mapData = MapViewModel()
    // location manager ...
    @State var locationManager = CLLocationManager()
    
    var body: some View {
        
        ZStack {
            
            // MapView ...
            MapView()
            // using it as environment object so that it can be used ints subViews ...
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
        }
        .onAppear(perform: {
            //setting delegate...
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        // permission denied alert ...
        Alert(title: Text("Permission Denied"), message:
                Text("Please Enable Permission In App Settings"), dismissButton: .default(Text("Goto Settings"), action: {
            
            
        }
                                      
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
