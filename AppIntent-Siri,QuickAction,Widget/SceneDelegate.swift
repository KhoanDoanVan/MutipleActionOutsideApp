//
//  SceneDelegate.swift
//  WidgetLinking-iOS
//
//  Created by Đoàn Văn Khoan on 28/2/25.
//

import UIKit
import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private let appState = AppState.shared
    private let actionService = ActionService.shared


    // MARK: - Widget
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        print("✅ SceneDelegate is running")
                
        let contentView = ContentView()
            .environmentObject(appState)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
        if let urlContext = connectionOptions.urlContexts.first {
            handleDeepLink(urlContext.url)
        }
    }

    func scene(
        _ scene: UIScene,
        openURLContexts URLContexts: Set<UIOpenURLContext>
    ) {
        print("🔹 App Opened via Deep Link")
        
        if let urlContext = URLContexts.first {
            handleDeepLink(urlContext.url)
        }
    }
    
    private func handleDeepLink(_ url: URL) {
        print("🔹 Received URL: \(url.absoluteString)")
        
        if let route = AppRoute.fromWidget(url) {
            DispatchQueue.main.async {
                self.appState.path.append(route)
            }
        }
    }
    
    //  MARK: - Shortcut
    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        print("🔹 Quick Action Triggered: \(shortcutItem.type)")
        actionService.action = AppRoute.fromShortcut(shortcutItem)
        
        completionHandler(true)
    }
    
}
