//
//  LandmarkDetail.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import SwiftUI

struct LandmarkDetail: View {
  var landmark: Landmark
  @State var showingImage = false
  @EnvironmentObject var modelData: ModelData

  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where:) { $0.id == landmark.id }!
  }

  var body: some View {
    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .frame(height: 300)
        .offset(y: 130)
        .padding(.top, -130)

      Button {
        showingImage.toggle()
      } label: {
        CircleImage(image: landmark.image)
      }

      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
        }

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
    .sheet(isPresented: $showingImage) {
      LandmarkImage(landmark: landmark)
        .ignoresSafeArea(.all)
    }
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static var modelData = ModelData()

  static var previews: some View {
    LandmarkDetail(landmark: ModelData().landmarks[0])
      .previewLayout(.sizeThatFits)
      .environmentObject(modelData)
  }
}
