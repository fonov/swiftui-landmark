//
//  AppInfo.swift
//  landmark
//
//  Created by Sergei Fonov on 04.12.22.
//

import SwiftUI

struct AppInfo {
  // FIXME: extract in separate structure
  private var appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
  private var version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
  private var versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
  private var bundleIdentifier = Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String ?? ""

  var title: Text {
    Text(appName)
  }

  var message: Text {
    Text("""

    version: \(version) (\(versionNumber))
    \(bundleIdentifier)

    \u{A9} Fonov Sergei 2022
    """)
  }
}
