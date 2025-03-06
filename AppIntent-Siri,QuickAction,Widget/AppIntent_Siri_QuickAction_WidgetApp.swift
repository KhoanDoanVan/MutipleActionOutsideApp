//
//  AppIntent_Siri_QuickAction_WidgetApp.swift
//  AppIntent-Siri,QuickAction,Widget
//
//  Created by Đoàn Văn Khoan on 27/2/25.
//

import SwiftUI

@main
struct AppIntent_Siri_QuickAction_WidgetApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var appState = AppState.shared
    @StateObject private var actionService = ActionService.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .onReceive(actionService.$action) { action in
                    if let appRoute = action {
                        print("🔗 Navigating to: \(appRoute)")
                        DispatchQueue.main.async {
                            appState.path.append(appRoute)
                            actionService.action = nil
                        }
                    }
                }
        }
    }
}
