//
//  Place.swift
//  UFCExplorer
//
//  Created by Daniele Cavalcante on 17/05/22.
//

import SwiftUI
import MapKit

struct Place: Identifiable {

    var id = UUID().uuidString
    var place: CLPlacemark
}