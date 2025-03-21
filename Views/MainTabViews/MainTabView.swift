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
            
            StatsView(userProgress: userProgress, vm: ChartViewModel(userProgress: userProgress))
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.xaxis")
                }

            LessonView()
                .tabItem {
                    Label("Lessons", systemImage: "book.fill")
                }
            
            TestListView()
                .tabItem {
                    Label("Tests", systemImage: "pencil")
                }
            
            RecipeTabView()
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
        }
        .accentColor(.indigo)
        .background(
            Color.white.shadow(radius: 5)
        )
    }
}
