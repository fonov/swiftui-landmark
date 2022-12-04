//
//  AppInfo.swift
//  landmark
//
//  Created by Sergei Fonov on 04.12.22.
//

import SwiftUI

struct AppInfo: View {
  @State var showAlert = false

  @Environment(\.locale) var locale: Locale
  @Environment(\.colorScheme) var colorScheme: ColorScheme

  var body: some View {
    Button {
      showAlert.toggle()
    } label: {
      Label("App Info", systemImage: "info.circle")
        .labelStyle(.iconOnly)
    }
    .alert(isPresented: $showAlert) {
      Alert(title: Text("Landmark"), message: Text("""
        locale: \(locale.description)
        color scheme: \(colorScheme == .dark ? "Dark" : "Light")
      version: \(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String) (\(
        Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String))

      \(Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as! String)
      """))
    }
  }
}

struct AppInfo_Previews: PreviewProvider {
  static var previews: some View {
    AppInfo()
  }
}
