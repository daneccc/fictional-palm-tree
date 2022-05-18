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
            
            VStack {
                Spacer()
                
                VStack {
                    Button(action: {}, label: {
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                    
                    Button(action: mapData.updateMapType, label: {
                        Image(systemName: mapData.mapType == .standard ? "network" : "map")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
        }
        .onAppear(perform: {
            //setting delegate...
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        // permission denied alert ...
        .alert(isPresented: $mapData.permissionDenied, content: {
            Alert(title: Text("Permission Denied"), message: Text("Please Enable Permission In App Settings"), dismissButton: .default(Text("Goto Settings"), action: {
                // redireting user to settings ...
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                
                
            }))
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
