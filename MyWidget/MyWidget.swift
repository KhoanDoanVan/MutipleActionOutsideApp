//
//  MyWidget.swift
//  WidgetLinking-iOS
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import WidgetKit
import SwiftUI

@main
struct MyWidget: Widget {
    
    let kind: String = "Widget"
    
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            WidgetEntryView()
        }
        .configurationDisplayName("Quick Links")
        .description("Tap to navigate to different sections.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
    
}
