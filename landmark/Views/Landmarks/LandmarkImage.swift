//
//  LandmarkImage.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import SwiftUI

struct LandmarkImage: View {
  var landmark: Landmark

  var body: some View {
    landmark.image
  }
}

struct LandmarkImage_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkImage(landmark: ModelData().landmarks[0])
  }
}
