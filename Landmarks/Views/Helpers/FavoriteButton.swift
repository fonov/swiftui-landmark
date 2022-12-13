//
//  FavoriteButton.swift
//  landmark
//
//  Created by Sergei Fonov on 04.12.22.
//

import SwiftUI

struct FavoriteButton: View {
  @Binding var isSet: Bool

  var body: some View {
    Button {
      isSet.toggle()
    } label: {
      Label("Toggle Favorite", systemImage: "star\(isSet ? ".fill" : "")")
        .labelStyle(.iconOnly)
        .foregroundColor(isSet ? Color("gold") : .gray)
    }
  }
}

struct FavoriteButton_Previews: PreviewProvider {
  @State static var isSet = false

  static var previews: some View {
    FavoriteButton(isSet: $isSet)
  }
}
