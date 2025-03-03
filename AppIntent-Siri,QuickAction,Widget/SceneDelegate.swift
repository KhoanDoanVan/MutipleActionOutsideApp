//
//  SceneDelegate.swift
//  AppIntent-Siri,QuickAction,Widget
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import UIKit
import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private let actionService = ActionService.shared
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        let contentView = ContentView()
        
        if let urlContext = connectionOptions.urlContexts.first {
            handleDeepLink(urlContext.url)
        }
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
    }
    
    
    /// Handle Deep Links
    func scene(
        _ scene: UIScene,
        openURLContexts URLContexts: Set<UIOpenURLContext>
    ) {
        if let urlContext = URLContexts.first {
            handleDeepLink(urlContext.url)
        }
    }

    private func handleDeepLink(_ url: URL) {
        guard let host = url.host, !host.isEmpty else {
            print("Invalid URL: Missing host")
            return
        }
        if let route = AppRoute.fromWidget(host) {
            actionService.action = route
        }
    }
}
