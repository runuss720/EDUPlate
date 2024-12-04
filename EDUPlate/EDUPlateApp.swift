//
//  EDUPlateApp.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/17/24.
//

import SwiftUI

@main
struct EDUPlateApp: App {
    
    // state variable control visibility of welcome screen
    @State private var isVisible = true
    var body: some Scene {
        WindowGroup {
            
            if isVisible {
                WelcomeView(isVisible: $isVisible)
            } else {
                MainTabView()
            }
        }
    }
}
