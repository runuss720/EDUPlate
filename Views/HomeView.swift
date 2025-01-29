import SwiftUI

struct HomeView: View {
    @StateObject private var userProgress = UserProgress()
    @State private var userLevel: Int = 1  // Initialize user level

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Pass the binding of userLevel to LevelView
                    LevelView(level: $userLevel)
                
                    VStack(spacing: 16) {
                        Text("Test your knowledge".uppercased())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(.subheadline, weight: .medium))
                            .foregroundColor(.black)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                NavigationLink(destination: Test1View(userProgress: userProgress)) {
                                    TestCategoryCard(imageName: "utensils-unsplash", title: "Tools")
                                }

                                NavigationLink(destination: Test2View(userProgress: userProgress)) {
                                    TestCategoryCard(imageName: "ingredients-unsplash", title: "Ingredients")
                                }

                                NavigationLink(destination: Test3View(userProgress: userProgress)) {
                                    TestCategoryCard(imageName: "jez-timms-DVRXFIH42d0-unsplash (1)", title: "French Terms")
                                }
                            }
                        }
                    }

                    Divider()
                        .padding(.vertical, 20)

                    VStack(spacing: 16) {
                        Text("Lessons".uppercased())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(.subheadline, weight: .medium))
                            .foregroundColor(.black)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                if userLevel >= 1 {
                                    NavigationLink(destination: KnifeSkillView()) {
                                        LessonCard(imageName: "blend-archive-HGJMNY7tBDw-unsplash", title: "Knife Skills")
                                    }
                                }

                                if userLevel >= 2 {
                                    NavigationLink(destination: RoastingView()) {
                                        LessonCard(imageName: "angela-khebou-rgB9ZCw3XiU-unsplash", title: "Roasting")
                                        
                                        NavigationLink(destination: SoupsView()) {
                                            LessonCard(imageName: "Buffalo-Sauce-Recipe-SQ", title: "Soups")
                                            
                                        NavigationLink(destination: StockView()) {
                                            LessonCard(imageName: "stocks", title: "Stocks")
                                    }
                                }

                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
// Reusable Lesson Card
struct LessonCard: View {
    let imageName: String
    let title: String

    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
                .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                .padding()

            Text(title)
                .font(.headline)
                .padding(.top, 5)
        }
    }
}

// Reusable Test Category Card
struct TestCategoryCard: View {
    let imageName: String
    let title: String

    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 350, maxHeight: 300)
            .clipped()
            .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
            .padding()
            .overlay {
                Text(title)
                    .kerning(2.0)
                    .font(.custom("Anton SC", size: 29))
                    .foregroundColor(.white)
                    .shadow(color: Color.black, radius: 18)
            }
    }
}
#Preview {
    HomeView()
}
