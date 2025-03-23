//
//  EDUPlateApp.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/17/24.
//

import SwiftUI

@main
struct EDUPlateApp: App {
    @State private var isVisible = true
    @StateObject private var userProgress = UserProgress()  // Make sure to use StateObject

    var body: some Scene {
        WindowGroup {
            if isVisible {
                WelcomeView(isVisible: $isVisible)
                    .environmentObject(userProgress)  // Inject UserProgress
                    .preferredColorScheme(.light)
            } else {
                MainTabView()
                    .environmentObject(userProgress)  // Inject UserProgress
                    .preferredColorScheme(.light)
            }
        }
    }
}

