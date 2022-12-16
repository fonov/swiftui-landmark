//
//  Landmark.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import CoreLocation
import Foundation
import struct LandmarksUtils.Landmark
import SwiftUI

typealias Landmark = LandmarksUtils.Landmark

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
