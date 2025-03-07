//
//  AppState.swift
//  WidgetLinking-iOS
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedRoute: AppRoute?
    static let shared = AppState()
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(navigateToView(_:)), name: .openView, object: nil)
    }

    @objc private func navigateToView(_ notification: Notification) {
        if let routeName = notification.object as? String, let route = AppRoute(rawValue: routeName) {
            DispatchQueue.main.async {
                self.selectedRoute = route
            }
        }
        }
}
