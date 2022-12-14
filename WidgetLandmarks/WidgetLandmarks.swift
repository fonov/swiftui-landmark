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
  func placeholder(in _: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), configuration: ConfigurationIntent())
  }

  func getSnapshot(for configuration: ConfigurationIntent, in _: Context, completion: @escaping (SimpleEntry) -> Void) {
    let entry = SimpleEntry(date: Date(), configuration: configuration)
    completion(entry)
  }

  func getTimeline(for configuration: ConfigurationIntent, in _: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    var entries: [SimpleEntry] = []

    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = SimpleEntry(date: entryDate, configuration: configuration)
      entries.append(entry)
    }

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let configuration: ConfigurationIntent
}

struct WidgetLandmarksEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    Text(entry.date, style: .time)
  }
}

struct WidgetLandmarks: Widget {
  let kind: String = "WidgetLandmarks"

  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
      WidgetLandmarksEntryView(entry: entry)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}

struct WidgetLandmarks_Previews: PreviewProvider {
  static var previews: some View {
    WidgetLandmarksEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
