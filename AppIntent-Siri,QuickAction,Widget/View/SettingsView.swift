//
//  SettingsView.swift
//  QuickAction-DeepLinking
//
//  Created by Đoàn Văn Khoan on 27/2/25.
//

import SwiftUI

struct SettingsView: View {
    let shortcut = createSiriShortcut(title: "Open Settings",
                                      phrase: "Open Settings",
                                      activityType: "com.simonisdev.AppIntent-Siri-QuickAction-Widget.openSettings")

    var body: some View {
        VStack {
            Text("Settings View")
                .navigationTitle("Settings")
            
            SiriButton(shortcut: shortcut).frame(height: 34)
        }
    }
}

#Preview {
    SettingsView()
}
