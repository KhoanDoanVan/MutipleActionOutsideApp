//
//  Provider.swift
//  WidgetLinking-iOS
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import WidgetKit
import SwiftUI

// MARK: - Timeline Entry
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
