//
//  CategoryHome.swift
//  landmark
//
//  Created by Sergei Fonov on 10.12.22.
//

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var modelData: ModelData

  var body: some View {
    NavigationView {
      List {
        if !modelData.futures.isEmpty {
          modelData.futures[0].image
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .clipped()
            .listRowInsets(EdgeInsets())
        }

        ForEach(modelData.category.keys.sorted(), id: \.self) { key in
          CategoryRow(categoryName: key, items: modelData.category[key] ?? [])
        }
        .listRowInsets(EdgeInsets())
      }
      .navigationTitle("Featured")
    }
  }
}

struct CategoryHome_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome()
      .environmentObject(ModelData())
  }
}
