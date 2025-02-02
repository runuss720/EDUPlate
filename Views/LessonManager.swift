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
                    }
                }
            }
        }
    }
}
