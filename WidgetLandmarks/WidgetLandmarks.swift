//
//  WidgetLandmarks.swift
//  WidgetLandmarks
//
//  Created by Sergei Fonov on 14.12.22.
//

import Intents
import SwiftUI
import WidgetKit

struct Provider: IntentTimelineProvider {
  func placeholder(in _: Context) -> LandmarkEntry {
    LandmarkEntry(date: Date(), landmark: ModelData().landmarks[0])
  }

  func getSnapshot(for _: ConfigurationIntent, in _: Context, completion: @escaping (LandmarkEntry) -> Void) {
    let landmark = ModelData().landmarks.randomElement()!
    let entry = LandmarkEntry(date: Date(), landmark: landmark)
    completion(entry)
  }

  func getTimeline(for _: ConfigurationIntent, in _: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    var entries: [LandmarkEntry] = []

    let landmarks = ModelData().landmarks

    let currentDate = Date()
    for minuteOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .minute, value: 15 * minuteOffset, to: currentDate)!
      let entry = LandmarkEntry(date: entryDate, landmark: landmarks.randomElement()!)
      entries.append(entry)
    }

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct LandmarkEntry: TimelineEntry {
  let date: Date
  let landmark: Landmark
}

struct WidgetLandmarksEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    let landmark = entry.landmark

    return
      GeometryReader { geometry in
        VStack {
          landmark.image
            .resizable()
            .scaledToFill()
            .frame(width: geometry.size.width, height: geometry.size.height)
            .overlay {
              ZStack(alignment: .topTrailing) {
                TextOverlay(landmark: landmark)
                if landmark.isFavorite {
                  Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color("gold"))
                    .shadow(color: .black, radius: 6)
                    .padding()
                }
              }
            }
        }
      }
  }
}

struct WidgetLandmarks: Widget {
  let kind: String = "WidgetLandmarks"

  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
      WidgetLandmarksEntryView(entry: entry)
    }
    .configurationDisplayName("Landmark")
    .description("Show favorite landmarks.")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}

struct WidgetLandmarks_Previews: PreviewProvider {
  static var previews: some View {
    WidgetLandmarksEntryView(entry: LandmarkEntry(date: Date(), landmark: ModelData().landmarks[0]))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
