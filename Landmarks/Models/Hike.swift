//
//  Hike.swift
//  landmark
//
//  Created by Sergei Fonov on 10.12.22.
//

import Foundation
import struct LandmarksUtils.Hike

typealias Hike = LandmarksUtils.Hike

// MARK: distance description

extension Hike {
  static var formatter = LengthFormatter()

  var distanceText: String {
    Hike.formatter.string(fromValue: distance, unit: .kilometer)
  }
}

// MARK: Load hikes from server

extension ModelData {
  var hikesUrl: String {
    Bundle.main.object(forInfoDictionaryKey: "AppHikesUrl") as? String ?? ""
  }

  func getHikes() {
    guard let url = URL(string: hikesUrl) else { fatalError("wrong url") }
    let networkRequest = URLRequest(url: url)
    let dataTask = URLSession.shared.dataTask(with: networkRequest) { data, response, error in
      if error != nil {
        self.isSuccessRequestHikes = false
      }

      guard let response = response as? HTTPURLResponse else { return }
      if response.statusCode != 200 { return }
      guard let data else { return }

      DispatchQueue.main.async {
        do {
          let decoder = JSONDecoder()
          self.hikes = try decoder.decode([Hike].self, from: data)
          self.isSuccessRequestHikes = true

          UserDefaults.standard.set(data, forKey: Hike.storeKey)
        } catch {
          self.isSuccessRequestHikes = false
        }
      }
    }

    isSuccessRequestHikes = nil

    if let hikes = UserDefaults.standard.object(forKey: Hike.storeKey) as? Data {
      do {
        let decoder = JSONDecoder()
        self.hikes = try decoder.decode([Hike].self, from: hikes)
      } catch {
        fatalError("JSON's corrupt")
      }
    }

    dataTask.resume()
  }
}
