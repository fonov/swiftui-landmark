//
//  LandmarkCommands.swift
//  MacLandmarks
//
//  Created by Sergei Fonov on 13.12.22.
//

import SwiftUI

struct LandmarksCommands: Commands {
  @FocusedBinding(\.selectedLandmark) var selectedLandmark

  var body: some Commands {
    SidebarCommands()

    CommandMenu("Landmark") {
      Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
        selectedLandmark?.isFavorite.toggle()
      }
      .disabled(selectedLandmark == nil)
      .keyboardShortcut("f", modifiers: [.command])
    }
  }
}

private struct SelectedLandmarkKey: FocusedValueKey {
  typealias Value = Binding<Landmark>
}

extension FocusedValues {
  var selectedLandmark: Binding<Landmark>? {
    get { self[SelectedLandmarkKey.self] }
    set { self[SelectedLandmarkKey.self] = newValue }
  }
}
