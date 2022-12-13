//
//  ContentView.swift
//  WatchLandmark Watch App
//
//  Created by Sergei Fonov on 12.12.22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ModelData())
  }
}
