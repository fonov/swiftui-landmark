//
//  MapView.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import MapKit
import SwiftUI

struct MapView: View {
  var coordinate: CLLocationCoordinate2D

  @AppStorage("MapView.zoom")
  private var zoom: Zoom = .medium

  /// the zoom enumeration to characterize the zoom level.
  enum Zoom: String, CaseIterable, Identifiable {
    case near = "Near"
    case medium = "Medium"
    case far = "Far"

    var id: Zoom { self }
  }

  var delta: CLLocationDegrees {
    switch zoom {
    case .near:
      return 0.02
    case .medium:
      return 0.2
    case .far:
      return 2
    }
  }

  var body: some View {
    Map(coordinateRegion: .constant(region))
  }

  var region: MKCoordinateRegion {
    MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 41.7182513, longitude: 44.77895))
  }
}
