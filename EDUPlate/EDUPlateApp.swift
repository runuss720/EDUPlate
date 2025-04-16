import SwiftUI

@main
struct EDUPlateApp: App {
    @State private var isVisible = true
    @StateObject private var userProgress = UserProgress()

    var body: some Scene {
        WindowGroup {
            if isVisible {
                WelcomeView(isVisible: $isVisible)
                    .environmentObject(userProgress)
                    .preferredColorScheme(.light)
            } else {
                MainTabView()
                    .environmentObject(userProgress)
                    .preferredColorScheme(.light)
            }
        }
    }
}

