//
//  ModelData.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import Combine
import Foundation

final class ModelData: ObservableObject {
  @Published var landmarks: [Landmark] = load("landmarkData.json")
  var hikes: [Hike] = load("hikeData.json")
  @Published var profile: Profile = .default

  var category: [String: [Landmark]] {
    Dictionary(grouping: landmarks) {
      $0.category.rawValue
    }
  }

  var futures: [Landmark] {
    landmarks.filter(\.isFavorite)
  }
}

func load<T: Decodable>(_ filename: String) -> T {
  let data: Data

  guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
    fatalError("Couldn't find \(filename) in main bundle.")
  }

  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }

  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}
