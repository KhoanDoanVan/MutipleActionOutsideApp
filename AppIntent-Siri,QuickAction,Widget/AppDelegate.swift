//
//  AppDelegate.swift
//  WidgetLinking-iOS
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    private let actionService = ActionService.shared
    
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        
        print("✅ AppDelegate is running...")
        if let shortcutItem = options.shortcutItem {
            if let appRoute = AppRoute.fromShortcut(shortcutItem) {
                print("🔗 Launched from Shortcut: \(appRoute)")
                actionService.action = appRoute
            } else {
                print("❌ Invalid Shortcut Item: \(shortcutItem.type)")
            }
        }
        
        let configuration = UISceneConfiguration(
            name: connectingSceneSession.configuration.name,
            sessionRole: connectingSceneSession.role
        )
        
        configuration.delegateClass = SceneDelegate.self
        return configuration
    }
    
    func application(
        _ application: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        print("📌 Deep Link Received: \(url)")

        guard let route = AppRoute.fromWidget(url) else { return false }
        
        DispatchQueue.main.async {
            ActionService.shared.action = route
        }
        
        return true
    }
}

