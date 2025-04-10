import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var userProgress: UserProgress
    
    @State private var userLevel: Int = 1
    @State private var displayedUsername: String = ""
    
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
                                
                                // display all tests
                                // only ones meeting level requirment will show up
                                foodPrepManager(filter: 1)
                                foodSafetyManager(filter: 1)
                                internationalTermsManager(filter: 1)
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
                    
                    // display lessons
                    LessonManager(filter: 2)
                }
            }
            .padding(.horizontal)
            .onAppear {
                userProgress.fetchUserData()
            }
        }
    }
}

// used to display test buttons
// displays title, time needed to take, and category
struct TestCategoryCard: View {
    @EnvironmentObject private var userProgress: UserProgress
    var filter: Int?
    let title: String
    let time: Int
    let category: String
    let levelRequired: Int
    
    var body: some View {
        if (filter == 1) {
            // only show new tests
            if (userProgress.currentLevel == levelRequired) {
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
        else {
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
}

#Preview {
    HomeView().environmentObject(UserProgress())
}
