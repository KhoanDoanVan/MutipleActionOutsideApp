//
//  ProfileView.swift
//  QuickAction-DeepLinking
//
//  Created by Đoàn Văn Khoan on 27/2/25.
//

import SwiftUI

struct ProfileView: View {
    let shortcut = createSiriShortcut(title: "Open Profile",
                                      phrase: "Show My Profile",
                                      activityType: "com.simonisdev.AppIntent-Siri-QuickAction-Widget.openProfile")

    var body: some View {
        VStack {
            Text("Profile")
                .navigationTitle("Profile")
            
            SiriButton(shortcut: shortcut).frame(height: 34)
        }
    }
}

#Preview {
    ProfileView()
}
