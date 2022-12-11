//
//  Profile.swift
//  landmark
//
//  Created by Sergei Fonov on 11.12.22.
//

import Foundation

struct Profile {
  var username: String
  var prefersNotification = true
  var seasonalPhoto = Season.winter
  var goalDate = Date()

  static let `default` = Profile(username: "s_fonov")

  enum Season: String, CaseIterable, Identifiable {
    case spring = "🌹"
    case summer = "☀️"
    case autumn = "🍁"
    case winter = "❄️"

    var id: String { rawValue }
  }
}
