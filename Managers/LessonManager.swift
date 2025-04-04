import SwiftUI

struct LessonManager: View {
    @StateObject private var userProgress = UserProgress()
    @State private var userLevel: Int = 1
    let length: Int

    init(length: Int) {
        self.length = length
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                
                // used for displaying a few lessons on home page
                if length == 1 {
                    NavigationLink(destination: KnifeSkillView()) {
                        LessonCard(title: "Knife Skills")
                    }
                    NavigationLink(destination: RoastingView()) {
                        LessonCard(title: "Roasting")
                    }
                    NavigationLink(destination: SoupsView()) {
                        LessonCard(title: "Soups")
                    }
                } else {
                    
                    // display full list of lessons
                    if userLevel >= 1 {
                        NavigationLink(destination: HygeneView()) {
                            LessonCard(title: "Personal Hygene")
                        }
                        NavigationLink(destination: KnifeSkillView()) {
                            LessonCard(title: "Knife Skills")
                        }
                        NavigationLink(destination: RoastingView()) {
                            LessonCard(title: "Roasting")
                        }
                        
                    }
                    if userLevel >= 2 {
                        NavigationLink(destination: HygeneView()) {
                            LessonCard(title: "Personal Hygene")
                        }
                        NavigationLink(destination: KnifeSkillView()) {
                            LessonCard(title: "Knife Skills")
                        }
                        NavigationLink(destination: RoastingView()) {
                            LessonCard(title: "Roasting")
                        }
                        NavigationLink(destination: SoupsView()) {
                            LessonCard(title: "Soups")
                        }
                        NavigationLink(destination: StockView()) {
                            LessonCard(title: "Stocks")
                        }
                        NavigationLink(destination: GrillingView()) {
                            LessonCard(title: "Grilling")
                        }
                        NavigationLink(destination: FoodSafetyView()) {
                            LessonCard(title: "Food Safety")
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
