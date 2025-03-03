//
//  MyWidget.swift
//  MyWidget
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Provider: TimelineProvider {
    /// Placeholder for the widget preview in Widget Gallery
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    /// Snapshot used in Widget Gallery or when no real data is available
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    /// Providing the actual timeline entries for the widget
    func getTimeline(
        in context: Context,
        completion: @escaping (
            Timeline<SimpleEntry>
        ) -> Void
    ) {
        let currentDate = Date()
        let entry = SimpleEntry(date: currentDate)
        
        /// Update every 15 minutes
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        
        completion(timeline)
    }

}


struct WidgetEntryView: View {
    var body: some View {
        WidgetView()
    }
}


struct WidgetView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            WidgetLinkButton(
                title: "Navi to Home",
                url: "com.simonisdev.AppIntent-Siri-QuickAction-Widget.home"
            )
            WidgetLinkButton(
                title: "Navi to Profile",
                url: "com.simonisdev.AppIntent-Siri-QuickAction-Widget.profile"
            )
            WidgetLinkButton(
                title: "Navi to Settings",
                url: "com.simonisdev.AppIntent-Siri-QuickAction-Widget.settings"
            )
        }
        .padding()
    }
    
}

struct WidgetLinkButton: View {
    
    let title: String
    let url: String
    
    var body: some View {
        Link(destination: URL(string: url)!) {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 10)
                .padding()
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(
                    .rect(cornerRadius: 20)
                )
        }
    }
    
}

