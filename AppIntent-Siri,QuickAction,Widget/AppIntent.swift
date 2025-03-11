//
//  AppIntent.swift
//  AppIntent-Siri,QuickAction,Widget
//
//  Created by Đoàn Văn Khoan on 6/3/25.
//

import AppIntents
import Foundation
import SwiftUI
import AppIntents
import Intents


struct OpenAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Open App with Navigation"
    static var description = IntentDescription("Opens the app and navigates to a selected screen.")

    @Parameter(title: "Destination")
    var destination: AppRoute

    func perform() async throws -> some IntentResult {
        await openApp(with: destination)
        return .result()
    }
    
//    private func openApp(with route: AppRoute) async {
//        let scheme = "simonisdev.AppIntent-Siri-QuickAction-Widget"
//        guard let url = URL(string: "\(scheme)://\(route.rawValue)") else {
//            print("🚨 Invalid URL")
//            return
//        }
//
//        print("✅ Valid URL: \(url.absoluteString)")
//
//        await MainActor.run {
//            if UIApplication.shared.canOpenURL(url) {
//                print("Can open URL")
//            } else {
//                print("Cannot open URL")
//            }
//            UIApplication.shared.open(url, options: [:]) { success in
//                print("✅ Open App Success: \(success)")
//            }
//        }
//    }
    
//    private func openApp(with route: AppRoute) async {
//        let scheme = "simonisdev.AppIntent-Siri-QuickAction-Widget"
//        guard let url = URL(string: "\(scheme)://\(route.rawValue)") else {
//            print("🚨 Invalid URL")
//            return
//        }
//
//        print("✅ Valid URL: \(url.absoluteString)")
//
//        // Sử dụng NSUserActivity thay vì UIApplication.open
//        let activity = NSUserActivity(activityType: "com.simonisdev.AppIntent-Siri-QuickAction-Widget.openApp")
//        activity.userInfo = ["route": route.rawValue]
//        activity.webpageURL = url // Gắn URL để hệ thống nhận diện
//        activity.becomeCurrent()
//
//        print("✅ Triggered NSUserActivity for route: \(route.rawValue)")
//        
//    }
    private func openApp(with route: AppRoute) async {
        let scheme = "simonisdev.AppIntent-Siri-QuickAction-Widget"
        guard let url = URL(string: "\(scheme)://\(route.rawValue)") else {
            print("🚨 Invalid URL")
            return
        }

        print("✅ Valid URL: \(url.absoluteString)")

        // Sử dụng NSUserActivity để truyền thông tin
        let activity = NSUserActivity(activityType: "com.simonisdev.AppIntent-Siri-QuickAction-Widget.openApp")
        activity.userInfo = ["route": route.rawValue]
        activity.becomeCurrent() // Kích hoạt NSUserActivity

        print("✅ Triggered NSUserActivity for route: \(route.rawValue)")
    }
    
    
}


extension Notification.Name {
    static let openView = Notification.Name("openView")
}
