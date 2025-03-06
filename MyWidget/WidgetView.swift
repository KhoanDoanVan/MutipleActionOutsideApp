//
//  WidgetView.swift
//  WidgetLinking-iOS
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import SwiftUI
import WidgetKit

struct WidgetView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            WidgetLinkButton(
                title: "Navi to Home",
                url: "simonisdev.AppIntent-Siri-QuickAction-Widget://home"
            )
            WidgetLinkButton(
                title: "Navi to Profile",
                url: "simonisdev.AppIntent-Siri-QuickAction-Widget://profile"
            )
            WidgetLinkButton(
                title: "Navi to Settings",
                url: "simonisdev.AppIntent-Siri-QuickAction-Widget://settings"
            )
        }
        .padding()
    }
    
}

struct WidgetLinkButton: View {
    
    let title: String
    let url: String
    
    var body: some View {
        if let validURL = URL(string: url) {
            Link(destination: validURL) {
                Text(title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 15)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        } else {
            Text("Invalid URL")
                .foregroundColor(.red)
        }
    }
    
}
