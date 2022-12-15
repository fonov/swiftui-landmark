//
//  CircleImage.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import SwiftUI

struct CircleImage: View {
  var image: Image

  var body: some View {
    image
      .clipShape(Circle())
      .overlay {
        Circle().stroke(.primary, lineWidth: 4)
      }
      .shadow(color: .secondary, radius: 7)
  }
}

struct CircleImage_Previews: PreviewProvider {
  static var previews: some View {
    CircleImage(image: ModelData().landmarks[0].image)
  }
}
