//
//  LandmarkDetail.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import SwiftUI

struct LandmarkDetail: View {
  var landmark: Landmark

  var body: some View {
    ScrollView {
      NavigationLink {
        MapView(coordinate: landmark.locationCoordinate)
          .ignoresSafeArea(.all)
      } label: {
        MapView(coordinate: landmark.locationCoordinate)
          .frame(height: 300)
          .offset(y: 130)
          .padding(.top, -130)
      }

      NavigationLink {
        LandmarkImage(landmark: landmark)
          .ignoresSafeArea(.all)
      } label: {
        CircleImage(image: landmark.image)
      }

      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)

        HStack {
          Text(landmark.park)
          Spacer()
          Text(landmark.state)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)

        Divider()

        Text("About \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding()
    }
    .ignoresSafeArea(edges: .top)
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkDetail(landmark: landmarks[0])
  }
}
