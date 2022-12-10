//
//  ContentView.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import SwiftUI

struct ContentView: View {
  @State private var section: Tab = .featured

  enum Tab {
    case featured
    case list
  }

  var body: some View {
    TabView(selection: $section) {
      CategoryHome()
        .tag(Tab.featured)
        .tabItem {
          Label("Featured", systemImage: "star.circle")
        }

      LandmarkList()
        .tag(Tab.list)
        .tabItem {
          Label("List", systemImage: "list.bullet.circle")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ModelData())
  }
}
