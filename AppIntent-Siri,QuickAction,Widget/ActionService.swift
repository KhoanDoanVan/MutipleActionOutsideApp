//
//  ActionService.swift
//  AppIntent-Siri,QuickAction,Widget
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import Foundation

class ActionService: ObservableObject {
    static let shared = ActionService()
    @Published var action: AppRoute?

    private init() {}
}
