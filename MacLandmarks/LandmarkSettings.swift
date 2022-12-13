//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by Sergei Fonov on 13.12.22.
//

import SwiftUI

struct LandmarkSettings: View {
  @AppStorage("MapView.zoom")
  private var zoom: MapView.Zoom = .medium

  var body: some View {
    VStack(alignment: .leading) {
      Form {
        Picker("Map View:", selection: $zoom) {
          ForEach(MapView.Zoom.allCases) { scale in
            Text(scale.rawValue).tag(scale)
          }
        }
        .pickerStyle(.inline)
      }
      Text("\u{A9} Sergei Fonov 2022")
        .foregroundColor(.secondary)
        .font(.subheadline)
    }
    .frame(width: 300)
    .navigationTitle("Landmark Settings")
    .padding(80)
  }
}

struct LandmarkSettings_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkSettings()
  }
}
