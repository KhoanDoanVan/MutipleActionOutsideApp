//
//  ContentView.swift
//  AppIntent-Siri,QuickAction,Widget
//
//  Created by Đoàn Văn Khoan on 27/2/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack(path: $appState.path) {
            VStack {
                List {
                    Button("Go to Home") { appState.path.append(AppRoute.home) }
                    Button("Go to Profile") { appState.path.append(AppRoute.profile) }
                    Button("Go to Settings") { appState.path.append(AppRoute.settings) }
                }
                .navigationTitle("Main Menu")
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home: HomeView()
                    case .profile: ProfileView()
                    case .settings: SettingsView()
                    }
                }
                
                
                Spacer()
            }
            .background(Color.gray)
        }
    }
}

#Preview {
    ContentView()
}
