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

// MARK: Load hikes from server

extension ModelData {
  func getHikes() {
    guard let url = URL(string: "https://gist.githubusercontent.com/fonov/cb49876673e79359dc40ba3619526900/raw/bef5b3b0baf64d01bebf4fe2e3e4c1e6662339e8/hikes.json") else { fatalError("wrong url") }
    let networkRequest = URLRequest(url: url)
    let dataTask = URLSession.shared.dataTask(with: networkRequest) {
      data, response, error in
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
        } catch {
          self.isSuccessRequestHikes = false
        }
      }
    }

    isSuccessRequestHikes = nil

    dataTask.resume()
  }
}
