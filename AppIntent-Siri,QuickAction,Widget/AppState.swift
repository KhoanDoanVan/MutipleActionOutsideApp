//
//  AppState.swift
//  AppIntent-Siri,QuickAction,Widget
//
//  Created by Đoàn Văn Khoan on 3/3/25.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var path: [AppRoute] = []
}
