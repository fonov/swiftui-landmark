//
//  LandmarkList.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import SwiftUI

struct LandmarkList: View {
  @EnvironmentObject var modelData: ModelData
  @State private var isFavoriteOnly = false

  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { landmark in
      !isFavoriteOnly || landmark.isFavorite
    }
  }

  var body: some View {
    NavigationView {
      List {
        Toggle(isOn: $isFavoriteOnly) {
          Text("Favourite only")
        }
        ForEach(filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
        }
      }
      .navigationTitle("Landmarks")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          AppInfo()
        }
      }
      .frame(minWidth: 300)
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LandmarkList()
        .environmentObject(ModelData())

      ForEach([
        "iPhone 14 Pro",
        "iPad Pro (11-inch) (4th generation)",
        "iPad mini (6th generation)",
      ], id: \.self) { deviceName in
        LandmarkList()
          .previewDevice(PreviewDevice(rawValue: deviceName))
          .previewDisplayName(deviceName)
          .environmentObject(ModelData())
      }
    }
  }
}
