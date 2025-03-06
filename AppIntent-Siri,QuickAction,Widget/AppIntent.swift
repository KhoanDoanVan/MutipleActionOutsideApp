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
//        openAppWithIntent()
//        return .result()
//    }
//    
////    private func openApp(with route: AppRoute) async {
////        guard let url = URL(string: "simonisdev://\(route.rawValue)") else {
////            print("🚨 Invalid URL")
////            return
////        }
////
////        print("valid url: \(url.absoluteString)")
////
////        await MainActor.run {
////            UIApplication.shared.open(url, options: [:]) { success in
////                print("✅ Open App Success: \(success)")
////            }
////        }
////    }
//
//    func openAppWithIntent() {
//        let intent = INStartCallIntent()
//        let interaction = INInteraction(intent: intent, response: nil)
//        interaction.donate { error in
//            if let error = error {
//                print("❌ Failed to donate interaction: \(error)")
//            } else {
//                print("✅ Intent donated successfully")
//            }
//        }
//    }
//}
//
//



struct OpenAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Open App with Navigation"
    static var description = IntentDescription("Opens the app and navigates to a selected screen.")

    @Parameter(title: "Destination")
    var destination: AppRoute

    func perform() async throws -> some IntentResult {
        await openAppWithIntent()
        return .result()
    }

    private func openAppWithIntent() async {
        guard let url = URL(string: "simonisdev://\(destination.rawValue)") else {
            print("🚨 Invalid URL")
            return
        }

        print("valid url: \(url.absoluteString)")

        await MainActor.run {
            UIApplication.shared.open(url, options: [:]) { success in
                print("✅ Open App Success: \(success)")
            }
        }
    }
}
