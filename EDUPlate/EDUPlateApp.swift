//
//  EDUPlateApp.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/17/24.
//

import SwiftUI

@main
struct EDUPlateApp: App {
    // State variable to control the visibility of the welcome screen
    @State private var isVisible = true
    
    // Create a shared UserProgress instance
    @StateObject private var userProgress = UserProgress()
    
    var body: some Scene {
        WindowGroup {
            if isVisible {
                WelcomeView(isVisible: $isVisible)
            } else {
                MainTabView(userProgress: userProgress) // Pass the UserProgress instance
            }
        }
    }
}
