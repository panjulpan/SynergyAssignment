//
//  WidgetTest.swift
//  WidgetTest
//
//  Created by Moch. Fadli Rahmadi on 14/01/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
      SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
      let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
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

struct WidgetTestEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family // check size of the widget
          
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            Text("Go to main screen") //.systemSmall widgets are one large tap area
        case .systemMedium:
            HStack{
                Link(destination: URL(string: "assignmentapp://page_one")!, label: {
                    Text("Page 1")
                })
                Spacer()
                Link(destination: URL(string: "assignmentapp://page_two")!, label: {
                    Text("Page 2")
                })
                Spacer()
                Link(destination: URL(string: "assignmentapp://page_three")!, label: {
                    Text("Page 3")
                })
                Spacer()
                Link(destination: URL(string: "assignmentapp://page_four")!, label: {
                    Text("Page 4")
                })
            }
            .padding()
        default:
          Text("Large widget")
        }
    }
}

struct WidgetTest: Widget {
    let kind: String = "WidgetTest"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetTestEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetTest_Previews: PreviewProvider {
    static var previews: some View {
        WidgetTestEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
