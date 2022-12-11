//
//  TextOverlay.swift
//  landmark
//
//  Created by Sergei Fonov on 11.12.22.
//

import SwiftUI

struct TextOverlay: View {
  var landmark: Landmark

  var gradient: LinearGradient {
    .linearGradient(Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]), startPoint: .bottom, endPoint: .top)
  }

  var body: some View {
    ZStack(alignment: .bottomLeading) {
      gradient
      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)
          .bold()
        Text(landmark.park)
      }
      .padding()
    }
    .foregroundColor(.white)
  }
}

struct TextOverlay_Previews: PreviewProvider {
  static var previews: some View {
    TextOverlay(landmark: ModelData().landmarks[0])
  }
}
