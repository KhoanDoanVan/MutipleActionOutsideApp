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
}

