//
//  JRNLWidget.swift
//  JRNLWidget
//
//  Created by KimJunsoo on 4/2/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), journalEntryDate: "JRNL", journalEntryTitle: "")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), journalEntryDate: "JRNL", journalEntryTitle: "")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        
        SharedData.shared.fetchJournalEntries()
        let journalEntries = SharedData.shared.getAllJournalEntries()
        
        for minutesOffset in 0..<journalEntries.count {
            let entryDate = currentDate.addingTimeInterval(TimeInterval(minutesOffset * 60))
            let entry = SimpleEntry(
                date: entryDate,
                journalEntryDate: journalEntries[minutesOffset].title ?? "JRNL",
                journalEntryTitle: journalEntries[minutesOffset].entryTitle
            )
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var journalEntryDate: String
    var journalEntryTitle: String
}

struct JRNLWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.journalEntryDate)
            Text(entry.journalEntryTitle)
        }
    }
}

struct JRNLWidget: Widget {
    let kind: String = "JRNLWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                JRNLWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                JRNLWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium, .accessoryRectangular])
    }
}

#Preview(as: .systemSmall) {
    JRNLWidget()
} timeline: {
    SimpleEntry(date: .now, journalEntryDate: "2025년 4월 21일", journalEntryTitle: "오늘은 좋은 날 입니다.")
    SimpleEntry(date: .now, journalEntryDate: "2025년 4월 22일", journalEntryTitle: "오늘은 흐린 날 입니다.")
    SimpleEntry(date: .now, journalEntryDate: "2025년 4월 23일", journalEntryTitle: "오늘은 나쁜 날 입니다.")
}
