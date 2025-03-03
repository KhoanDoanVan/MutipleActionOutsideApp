//
//  AppRoute.swift
//  AppIntent-Siri,QuickAction,Widget
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import Foundation
import UIKit

enum AppRoute: String, CaseIterable, Hashable, Codable {
    case home
    case profile
    case settings
    
    static func fromWidget(_ widgetURLString: String) -> AppRoute? {
        return AppRoute(rawValue: widgetURLString)
    }
}
