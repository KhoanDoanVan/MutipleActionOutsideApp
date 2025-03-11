//
//  HomeView.swift
//  QuickAction-DeepLinking
//
//  Created by Đoàn Văn Khoan on 27/2/25.
//

import SwiftUI

struct HomeView: View {
    let shortcut = createSiriShortcut(title: "Open Home",
                                      phrase: "Open Home",
                                      activityType: "com.simonisdev.AppIntent-Siri-QuickAction-Widget.openHome")

    var body: some View {
        VStack {
            Text("Home View")
                .navigationTitle("Home")
            
            SiriButton(shortcut: shortcut).frame(height: 34)
        }
    }
}

#Preview {
    HomeView()
}
