//
//  landmarkApp.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import SwiftUI

@main
struct LandmarkApp: App {
  @StateObject private var modelData = ModelData()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(modelData)
    }
    #if !os(watchOS)
    .commands {
      LandmarksCommands()
    }
    #endif

    #if os(watchOS)
      WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
    #endif

    #if os(macOS)
      Settings {
        LandmarkSettings()
      }
    #endif
  }
}
