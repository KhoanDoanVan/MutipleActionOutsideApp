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
            print("From shortcut")
            actionService.action = AppRoute.fromShortcut(shortcutItem)
        }
        
        let configuration = UISceneConfiguration(
            name: connectingSceneSession.configuration.name,
            sessionRole: connectingSceneSession.role
        )
        
        configuration.delegateClass = SceneDelegate.self
        return configuration
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("📌 Deep Link Received: \(url)")

        guard let route = AppRoute.fromWidget(url) else { return false }
        
        DispatchQueue.main.async {
            ActionService.shared.action = route
        }
        
        return true
    }
    
    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if let urlString = userActivity.userInfo?["url"] as? String,
           let url = URL(string: urlString) {
            DispatchQueue.main.async {
                UIApplication.shared.open(url)
            }
            return true
        }
        return false
    }
}

