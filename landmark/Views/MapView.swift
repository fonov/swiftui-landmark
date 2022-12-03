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

  @State private var region = MKCoordinateRegion()

  var body: some View {
    Map(coordinateRegion: $region)
      .onAppear {
        setRegion(coordinate)
      }
  }

  private func setRegion(_ coordinate: CLLocationCoordinate2D) {
    region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 41.7182513, longitude: 44.77895))
  }
}
