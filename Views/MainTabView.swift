import SwiftUI

struct MainTabView: View {
    @ObservedObject var userProgress: UserProgress
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
                .tabItem {
                    Label("Lessons", systemImage: "carrot")
                }
            
            StatsView(userProgress: userProgress) // Pass the same instance
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.xaxis")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .accentColor(.indigo)
        .background(
            Color.white.shadow(radius: 5)
        )
    }
}
