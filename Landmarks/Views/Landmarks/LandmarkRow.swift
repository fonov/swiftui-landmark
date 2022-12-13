//
//  LandmarkRow.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark

  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
        .cornerRadius(5)
      VStack(alignment: .leading) {
        Text(landmark.name)
          .bold()
        #if !os(watchOS)
          Text(landmark.park)
            .font(.caption)
            .foregroundColor(.secondary)
        #endif
      }

      Spacer()

      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .imageScale(.medium)
          .foregroundColor(Color("gold"))
      }
    }
    .padding(5)
  }
}

struct LandmarkRow_Previews: PreviewProvider {
  static var landmarks = ModelData().landmarks

  static var previews: some View {
    Group {
      LandmarkRow(landmark: landmarks[1])
      LandmarkRow(landmark: landmarks[2])
    }.previewLayout(.fixed(width: 300, height: 70))
  }
}
