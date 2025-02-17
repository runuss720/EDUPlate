import SwiftUI

struct MainTabView: View {
    //@ObservedObject var userProgress: UserProgress
    @EnvironmentObject var userProgress: UserProgress
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            StatsView(userProgress: userProgress) 
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.xaxis")
                }
            
            LessonView()
                .tabItem {
                    Label("Lessons", systemImage: "book.fill")
                }
            
            TestTabView()
                .tabItem {
                    Label("Tests", systemImage: "pencil")
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
