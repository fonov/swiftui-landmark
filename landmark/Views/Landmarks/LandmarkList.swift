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
  @State private var filter = FilteredCategory.all
  @State private var selectedLandmark: Landmark?

  enum FilteredCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"

    var id: FilteredCategory { self }
  }

  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { landmark in
      (
        !isFavoriteOnly || landmark.isFavorite
      ) &&
        (
          filter == .all || filter.rawValue == landmark.category.rawValue
        )
    }
  }

  var title: String {
    let title = filter == .all ? "Landmarks" : filter.rawValue
    return isFavoriteOnly ? "Favorite \(title)" : title
  }

  var index: Int {
    modelData.landmarks.firstIndex(where: {
      $0.id == selectedLandmark?.id
    }) ?? 0
  }

  var body: some View {
    NavigationView {
      List(selection: $selectedLandmark) {
        ForEach(filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
          .tag(landmark)
        }
      }
      .navigationTitle(title)
      .frame(minWidth: 300)
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Menu {
            Picker("Category", selection: $filter) {
              ForEach(FilteredCategory.allCases) { category in
                Text(category.rawValue)
                  .tag(category)
              }
            }
            .pickerStyle(.inline)
            Toggle(isOn: $isFavoriteOnly) {
              Text("Favourite only")
            }
            // FIXME: button doesn't show alert
            AppInfo()
          } label: {
            Label("Filter", systemImage: "slider.horizontal.3")
          }
        }
      }

      Text("Select a Landmark")
    }
    .focusedValue(\.selectedLandmark, $modelData.landmarks[index])
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
