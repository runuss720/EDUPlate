//
//  MainTabView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/17/24.
//
import SwiftUI

struct MainTabView: View {
    @ObservedObject var userProgress: UserProgress
    
    var body: some View {
        TabView {
            
            // Example: Home View
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            // Stat View Tab
            StatsView(userProgress: userProgress) // Pass the same instance
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.xaxis")
                }
            
            // Profile View Tab
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
            
            // Add other views here
        }
        .accentColor(.pink)
        .background(
            Color.white.shadow(radius: 5) // Custom background for the tab bar
        )
    }
}
