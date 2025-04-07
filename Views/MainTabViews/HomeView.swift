import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var userProgress: UserProgress
    @State private var userLevel: Int = 1
    @State private var displayedUsername: String = "" // Local state variable for username
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Image("ryan-walton-AbNO2iejoXA-unsplash")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding()
                        
                        VStack {
                            HStack {
                                Text("Hi \(userProgress.username)")
                                    .font(.system(size: 25, weight: .bold, design: .rounded))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 10)
                                    .foregroundStyle(.black)
                                
                                Text("Level \(userProgress.currentLevel)")
                                    .font(.system(size: 23, weight: .bold, design: .rounded))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 10)
                                    .padding(.leading, 40)
                                    .foregroundStyle(.indigo)
                            }
                            
                            LevelView(level: $userLevel)
                        }
                    }
                    
                    HStack {
                        Text("Upcoming Quizzes")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                            .foregroundStyle(.black)
                    }
                    
                    VStack(spacing: 16) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                    NavigationLink(destination: Test10View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Japanese Terms", time: 5, category: "International", levelRequired: 3)
                                    }
                                    
                                    NavigationLink(destination: Test9View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Spanish Terms", time: 5, category: "International", levelRequired: 3)
                                    }
                                
                                    NavigationLink(destination: Test3View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "French Terms", time: 5, category: "International", levelRequired: 2)
                                    }
                                    
                                    NavigationLink(destination: Test4View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Food Safety", time: 5, category: "Safety", levelRequired: 2)
                                    }
                                    
                                    NavigationLink(destination: Test2View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Ingredients", time: 5, category: "Food Prep", levelRequired: 2)
                                    }
                
                                    NavigationLink(destination: Test8View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Personal Hygiene", time: 2, category: "Safety", levelRequired: 1)
                                    }
                                    
                                    NavigationLink(destination: Test7View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Knife Skills", time: 2, category: "Food Prep", levelRequired: 1)
                                    }
                                    
                                    NavigationLink(destination: Test1View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Tools", time: 5, category: "Food Prep", levelRequired: 1)
                                    }
                                    
                                    NavigationLink(destination: Test5View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Basic Techniques", time: 2, category: "Food Prep", levelRequired: 2)
                                    }
                                    
                                
                            }
                        }
                    }
                }
                Divider()
                    .padding(.vertical, 10)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("Lessons")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                            .foregroundStyle(.black)
                        
                        Spacer()
                    }
                    
                    LessonManager()
                }
            }
            .padding(.horizontal)
            .onAppear {
                userProgress.fetchUserData()
            }
        }
    }
}


struct TestCategoryCard: View {
    @EnvironmentObject private var userProgress: UserProgress
    
    let title: String
    let time: Int
    let category: String
    let levelRequired: Int
    
    var body: some View {
        
        // only show if user meets level requirment
        if (userProgress.currentLevel >= levelRequired) {
            ZStack(alignment: .bottomLeading) {
                VStack {
                    Text(title)
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    
                    Text("Estimated Time: \(time) min")
                        .font(.system(size: 19, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                        .padding(.leading, 20)
                    
                    Text("\(category)")
                        .font(.system(size: 17, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                        .padding(.leading, 20)
                        .offset(x: -10, y: 110)
                    
                    Spacer()
                }
                .frame(width: 230, height: 220)
                .background(Color(red: 0.6, green: 0.7, blue: 1.1))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                
                Image(systemName: "play.circle")
                    .foregroundStyle(.white)
                    .font(.system(size: 70))
                    .offset(x: 135, y: -19)
            }
            .frame(width: 230, height: 240)
        }
    }
}

#Preview {
    HomeView().environmentObject(UserProgress())
}
