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
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
      LandmarkList()
        .environmentObject(ModelData())
  }
}
