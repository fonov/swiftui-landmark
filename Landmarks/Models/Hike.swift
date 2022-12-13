//
//  Hike.swift
//  landmark
//
//  Created by Sergei Fonov on 10.12.22.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
  var name: String
  var id: Int
  var distance: Double
  var difficulty: Int

  var observations: [Observation]
}

// MARK: observation struct

extension Hike {
  struct Observation: Codable, Hashable {
    var elevation: Range<Double>
    var pace: Range<Double>
    var heartRate: Range<Double>
    var distanceFromStart: Double
  }
}

// MARK: distance description

extension Hike {
  static var formatter = LengthFormatter()

  var distanceText: String {
    Hike.formatter.string(fromValue: distance, unit: .kilometer)
  }
}
