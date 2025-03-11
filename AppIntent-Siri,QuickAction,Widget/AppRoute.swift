//
//  AppRoute.swift
//  WidgetLinking-iOS
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import Foundation
import UIKit
import AppIntents

enum AppRoute: String, CaseIterable, Hashable, Codable, AppEnum {
    case home
    case profile
    case settings
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        "App Route"
    }

    static var caseDisplayRepresentations: [AppRoute: DisplayRepresentation] {
        [
            .home: "Home",
            .profile: "Profile",
            .settings: "Settings"
        ]
    }
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "home": self = .home
        case "profile": self = .profile
        case "settings": self = .settings
        default:
            print("❌ Invalid AppRoute: \(rawValue)")
            return nil
        }
    }
    
    static func fromWidget(_ url: URL) -> AppRoute? {
        guard let path = url.host else {
            print("❌ Invalid deep link: \(url)")
            return nil
        }
        
        print("🔹 Extracted path: \(path)")
        return AppRoute(rawValue: path)
    }
    
    static func fromShortcut(_ shortcutItem: UIApplicationShortcutItem) -> AppRoute? {
        guard let route = shortcutItem.type.components(separatedBy: ".").last else { return nil }
        print("From Shortcut")
        return AppRoute(rawValue: route)
    }
    
    static func fromActivity(_ activity: NSUserActivity) -> AppRoute? {
            switch activity.activityType {
        case "com.simonisdev.AppIntent-Siri-QuickAction-Widget.openHome":
            return .home
        case "com.simonisdev.AppIntent-Siri-QuickAction-Widget.openProfile":
            return .profile
        case "com.simonisdev.AppIntent-Siri-QuickAction-Widget.openSettings":
            return .settings
        default:
            return nil
        }
    }
}

