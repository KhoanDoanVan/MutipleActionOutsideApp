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
//            UIApplication.shared.open(url, options: [:]) { success in
//                print("✅ Open App Success: \(success)")
//            }
//        }
//    }
//}


struct OpenAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Open App with Navigation"
    static var description = IntentDescription("Opens the app and navigates to a selected screen.")

    @Parameter(title: "Destination")
    var destination: AppRoute

    func perform() async throws -> some IntentResult {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .openView, object: destination.rawValue)
        }
        return .result(opensIntent: self)
    }
}

extension Notification.Name {
    static let openView = Notification.Name("openView")
}
