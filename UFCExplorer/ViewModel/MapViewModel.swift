//
//  MapViewModel.swift
//  UFCExplorer
//
//  Created by Daniele Cavalcante on 17/05/22.
//

import SwiftUI
import MapKit
import CoreLocation

// all map data goes here ...

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var mapView = MKMapView()
    
    // region ...
    @Published var region : MKCoordinateRegion!
    // based on location it will set up ...
    
    // alert ...
    @Published var permissionDenied = false
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // checking permissions ...
        
        switch manager.authorizationStatus {
        case .denied:
            // alert
            permissionDenied.toggle()
        case .notDetermined:
            // requesting
            manager.requestWhenInUseAuthorization()
        default:
            ()
            
        }
    }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // error...
        print(error.localizedDescription)
    }
}
