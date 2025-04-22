import SwiftUI
struct LessonManager: View {
    
    @EnvironmentObject private var userProgress: UserProgress
    @State private var userLevel: Int = 1
    
    // filter controls what lessons to display
    // depending on what view it's being called from
    var filter: Int?
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                
                // filter: 1 - called from lessonview, display everything
                if (filter == 1) {
                    if userProgress.currentLevel >= 3 {
                        NavigationLink(destination: StockView()) {
                            LessonCard(title: "Stocks")
                        }
                    }
                    
                    if userProgress.currentLevel >= 2 {
                        NavigationLink(destination: GrillingView()) {
                            LessonCard(title: "Grilling")
                        }
                        NavigationLink(destination: SoupsView()) {
                            LessonCard(title: "Soups")
                        }
                        NavigationLink(destination: FoodSafetyView()) {
                            LessonCard(title: "Food Safety")
                        }
                    }
                    
                    if userProgress.currentLevel >= 1 {
                        NavigationLink(destination: BasicToolsView()) {
                            LessonCard(title: "Basic Tools")
                        }
                        NavigationLink(destination: HygeneView()) {
                            LessonCard(title: "Personal Hygiene")
                        }
                        NavigationLink(destination: KnifeSkillView()) {
                            LessonCard(title: "Knife Skills")
                        }
                        NavigationLink(destination: RoastingView()) {
                            LessonCard(title: "Roasting")
                        }
                    }
                }
                // filter called from homeview, display new lessons only
                else {
                    if userProgress.currentLevel == 3 {
                        NavigationLink(destination: StockView()) {
                            LessonCard(title: "Stocks")
                        }
                    }
                    
                    if userProgress.currentLevel == 2 {
                        NavigationLink(destination: GrillingView()) {
                            LessonCard(title: "Grilling")
                        }
                        NavigationLink(destination: SoupsView()) {
                            LessonCard(title: "Soups")
                        }
                        NavigationLink(destination: FoodSafetyView()) {
                            LessonCard(title: "Food Safety")
                        }
                    }
                    
                    if userProgress.currentLevel == 1 {
                        NavigationLink(destination: BasicToolsView()) {
                            LessonCard(title: "Basic Tools")
                        }
                        NavigationLink(destination: HygeneView()) {
                            LessonCard(title: "Personal Hygiene")
                        }
                        NavigationLink(destination: KnifeSkillView()) {
                            LessonCard(title: "Knife Skills")
                        }
                        NavigationLink(destination: RoastingView()) {
                            LessonCard(title: "Roasting")
                        }
                    }
                }
            }
        }
    }
}

struct LessonCard: View {
    let title: String
    var body: some View {
        VStack {
            Text(title)
                .font(.system(.largeTitle, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .padding(.top, 10)
                .padding(.leading, 20)
            Spacer()
        }
        .frame(width: 350, height: 90)
        .background(Color(red: 0.6, green: 0.7, blue: 1.1))
        .cornerRadius(20)
    }
}
