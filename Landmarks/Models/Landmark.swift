//
//  Landmark.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import CoreLocation
import Foundation
import SwiftUI

struct Landmark: Codable, Hashable, Identifiable {
  var name: String
  var city: String
  var state: String
  var id: Int
  var isFeatured: Bool
  var isFavorite: Bool
  var park: String
  var description: String
  private var imageName: String
  var category: Category
  private var coordinates: Coordinates

  enum Category: String, CaseIterable, Codable {
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
  }

  struct Coordinates: Codable, Hashable {
    var longitude: Double
    var latitude: Double
  }
}

extension Landmark {
  var locationCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
  }

  var image: Image {
    Image(imageName)
  }

  var featureImage: Image? {
    isFeatured ? Image("\(imageName)_feature") : nil
  }
}
