//
//  AppIntent_Siri_QuickAction_WidgetApp.swift
//  AppIntent-Siri,QuickAction,Widget
//
//  Created by Đoàn Văn Khoan on 27/2/25.
//

import SwiftUI

@main
struct AppIntent_Siri_QuickAction_WidgetApp: App {
    
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
