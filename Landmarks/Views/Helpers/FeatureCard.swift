//
//  FeatureCard.swift
//  landmark
//
//  Created by Sergei Fonov on 11.12.22.
//

import SwiftUI

struct FeatureCard: View {
  var landmark: Landmark

  var body: some View {
    landmark.featureImage?
      .resizable()
      .aspectRatio(3 / 2, contentMode: .fit)
      .overlay {
        TextOverlay(landmark: landmark)
      }
  }
}

struct FeatureCard_Previews: PreviewProvider {
  static var previews: some View {
    FeatureCard(landmark: ModelData().futures[0])
  }
}
