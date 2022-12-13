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
  @State private var isShowInfoAlert = false
  
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
          Button {
            isShowInfoAlert.toggle()
          } label: {
            Label("App Info", systemImage: "info.circle")
          }
          .padding(.bottom, 10)
        }
      }
      .alert(isPresented: $isShowInfoAlert) {
        let appInfo = AppInfo()
        return Alert(title: appInfo.title, message: appInfo.message)
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
