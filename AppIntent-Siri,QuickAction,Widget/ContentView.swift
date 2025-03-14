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
                .navigationDestination(isPresented: Binding(
                    get: { appState.selectedRoute != nil },
                    set: { _ in appState.selectedRoute = nil }
                )) {
                    if let route = appState.selectedRoute {
                        switch route {
                        case .home: HomeView()
                        case .profile: ProfileView()
                        case .settings: SettingsView()
                        }
                    }
                }
                .onContinueUserActivity("com.simonisdev.AppIntent-Siri-QuickAction-Widget.openHome") { activity in
                    handleUserActivity(activity)
                }
                .onContinueUserActivity("com.simonisdev.AppIntent-Siri-QuickAction-Widget.openProfile") { activity in
                    handleUserActivity(activity)
                }
                .onContinueUserActivity("com.simonisdev.AppIntent-Siri-QuickAction-Widget.openSettings") { activity in
                    handleUserActivity(activity)
                }
                
                
                Spacer()
            }
            .onOpenURL { url in
                handleDeepLink(url)
            }
            .background(Color.gray)
        }
    }
    
    private func handleDeepLink(_ url: URL) {
        print("🔹 Received deep link: \(url)")
        if let route = AppRoute.fromWidget(url) {
            DispatchQueue.main.async {
                appState.path.append(route)
            }
        } else {
            print("❌ Invalid deep link")
        }
    }

    
    private func handleUserActivity(_ userActivity: NSUserActivity) {
        print("🔹 Received activity: \(userActivity.activityType)")

        if let route = AppRoute.fromActivity(userActivity) {
            DispatchQueue.main.async {
                appState.path.append(route)
            }
        } else {
            print("❌ Invalid activity type")
        }
    }
}

#Preview {
    ContentView()
}
