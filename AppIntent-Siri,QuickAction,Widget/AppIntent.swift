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


//struct OpenAppIntent: AppIntent {
//    static var title: LocalizedStringResource = "Open App with Navigation"
//    static var description = IntentDescription("Opens the app and navigates to a selected screen.")
//
//    @Parameter(title: "Destination")
//    var destination: AppRoute
//
//    func perform() async throws -> some IntentResult {
//        await openApp(with: destination)
//        return .result()
//    }
//    
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
//    
//}


struct OpenAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Open App with Navigation"
    static var description = IntentDescription("Opens the app and navigates to a selected screen.")

    @Parameter(title: "Destination")
    var destination: AppRoute

//    func perform() async throws -> some IntentResult {
//        guard let url = URL(string: "simonisdev.AppIntent-Siri-QuickAction-Widget://\(destination.rawValue)") else {
//            print("🚨 Invalid URL")
//            return .result()
//        }
//
//        await MainActor.run {
//            
//            if UIApplication.shared.canOpenURL(url) {
//                                
//                UIApplication.shared.open(url, options: [:]) { success in
//                    print("✅ Open App Success: \(success)")
//                }
//            } else {
//                print("🚨 Cannot open URL")
//            }
//        }
//
//        
//        return .result()
//    }
    
//    func perform() async throws -> some IntentResult {
//        guard let url = URL(string: "simonisdev.AppIntent-Siri-QuickAction-Widget://\(destination.rawValue)") else {
//            print("🚨 Invalid URL")
//            return .result()
//        }
//
//        print("🔗 Attempting to open URL: \(url)")
//
//        let canOpen = await MainActor.run {
//            UIApplication.shared.canOpenURL(url)
//        }
//
//        if canOpen {
//            await MainActor.run {
//                UIApplication.shared.open(url) { success in
//                    print(success == true ? "✅ Open App Success" : "🚨 Cannot open URL")
//                }
//            }
//            
//        } else {
//            print("🚨 App không thể mở URL, kiểm tra Info.plist!")
//        }
//
//        return .result()
//    }
    func perform() async throws -> some IntentResult {
        let shortcutName = "MyShortcutName"
        let input = "SomeInput"

        guard let encodedName = shortcutName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let encodedInput = input.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("🚨 URL Encoding Failed")
            return .result()
        }

        let urlString = "shortcuts://run-shortcut?name=\(encodedName)&input=\(encodedInput)"

        guard let url = URL(string: urlString) else {
            print("🚨 Invalid URL")
            return .result()
        }

        print("🔗 Attempting to open URL: \(url)")

        await MainActor.run {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:]) { success in
                    print(success ? "✅ Shortcut Triggered Successfully" : "🚨 Failed to Trigger Shortcut")
                }
            } else {
                print("🚨 Cannot open Shortcuts app, check system settings!")
            }
        }

        return .result()
    }
}

extension Notification.Name {
    static let openView = Notification.Name("openView")
}
