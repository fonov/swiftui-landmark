//
//  LandmarkDetail.swift
//  WatchLandmark Watch App
//
//  Created by Sergei Fonov on 12.12.22.
//

import SwiftUI

struct LandmarkDetail: View {
  @EnvironmentObject var modelData: ModelData
  var landmark: Landmark

  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }

  var body: some View {
    ScrollView {
      VStack {
        CircleImage(image: landmark.image.resizable())
          .scaledToFit()

        Text(landmark.name)
          .font(.headline)
          .lineLimit(0)

        Toggle(isOn: $modelData.landmarks[landmarkIndex].isFeatured) {
          Text("Favorite")
        }

        Divider()

        Text(landmark.park)
          .font(.caption)
          .bold()
          .lineLimit(0)

        Text(landmark.state)
          .font(.caption)

        Divider()

        MapView(coordinate: landmark.locationCoordinate)
          .scaledToFit()
      }
      .padding(16)
    }
    .navigationTitle("Landmarks")
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static var previews: some View {
    let modelData = ModelData()
    return Group {
      LandmarkDetail(landmark: modelData.landmarks[0])
        .environmentObject(modelData)

      LandmarkDetail(landmark: modelData.landmarks[0])
        .environmentObject(modelData)
        .previewDevice("Apple Watch Series 8 (45mm)")
        .previewDisplayName("Apple Watch Series 8 (45mm)")

      LandmarkDetail(landmark: modelData.landmarks[0])
        .environmentObject(modelData)
        .previewDevice("Apple Watch Series 8 (41mm)")
        .previewDisplayName("Apple Watch Series 8 (41mm)")
    }
  }
}
