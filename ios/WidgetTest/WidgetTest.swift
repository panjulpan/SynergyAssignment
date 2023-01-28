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
            Text("The Milkyway")
              .foregroundColor(Color.white) //.systemSmall widgets are one large tap area
        case .systemMedium:
            HStack{
                Link(destination: URL(string: "assignmentapp://page_one")!, label: {
                  VStack(alignment: .center){
                    Image("mercury")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .trailing )
                    Text("Mercury")
                      .foregroundColor(Color.white)
                  }
                })
                Spacer()
                Link(destination: URL(string: "assignmentapp://page_two")!, label: {
                  VStack(alignment: .center){
                    Image("mars")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .trailing )
                    Text("Mars")
                      .foregroundColor(Color.white)
                  }
                })
                Spacer()
                Link(destination: URL(string: "assignmentapp://page_three")!, label: {
                  VStack(alignment: .center){
                    Image("jupiter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .trailing )
                    Text("Jupiter")
                      .foregroundColor(Color.white)
                  }
                })
                Spacer()
                Link(destination: URL(string: "assignmentapp://page_four")!, label: {
                  VStack(alignment: .center){
                    Image("uranus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .trailing )
                    Text("Uranus")
                      .foregroundColor(Color.white)
                  }
                })
            }
            .padding()
        default:
          Text("The Galaxy")
            .foregroundColor(Color.white)
        }
    }
}

struct WidgetTest: Widget {
    let kind: String = "WidgetTest"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetTestEntryView(entry: entry)
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .edgesIgnoringSafeArea(.all)
              .background(Image("background")
                .resizable()
                .scaledToFill())
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetTest_Previews: PreviewProvider {
    static var previews: some View {
        WidgetTestEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            // .frame(maxWidth: .infinity, maxHeight: .infinity)
            // .edgesIgnoringSafeArea(.all)
            // .background(Color.green)
    }
}
