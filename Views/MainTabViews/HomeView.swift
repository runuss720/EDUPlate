import SwiftUI

struct HomeView: View {
  //  @StateObject private var userProgress = UserProgress()
    @EnvironmentObject private var userProgress: UserProgress
    @State private var userLevel: Int = 1
    @State private var displayedUsername: String = "" // Local state variable for username

    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        
                        // profile picture
                        Image("ryan-walton-AbNO2iejoXA-unsplash")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding()
                        VStack {
                            HStack {
                               // Text("Hi, \(displayedUsername)!")
                                Text("Hi \(userProgress.username)")
                                    .font(.system(size: 25, weight: .bold, design: .rounded))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .clipped()
                                    .padding(.top, 10)
                                    .foregroundStyle(.black)
                                Text("Level \(userProgress.currentLevel)")
                                    .font(.system(size: 23, weight: .bold, design: .rounded))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .clipped()
                                    .padding(.top, 10)
                                    .padding(.leading, 40)
                                    .foregroundStyle(.indigo)
                            }
                            // Display level progress bar
                            LevelView(level: $userLevel)
                        }
                    }
                    
                    HStack {
                        Text("Upcoming Quizzes")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            .padding(.top, 10)
                            .foregroundStyle(.black)
                    }
                    
                    VStack(spacing: 16) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                //TestListView()
                                
                                // TODO: add to testmanager
                                NavigationLink(destination: Test1View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Tools", time: 5, category: "Food Prep")
                                }

                                NavigationLink(destination: Test2View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Ingredients", time: 5, category: "Food Prep")
                                }

                                NavigationLink(destination: Test3View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "French Terms", time: 5, category: "International")
                                }
                                
                                NavigationLink(destination: Test4View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Food Safety", time: 5, category: "Safety")
                                }
                                
                                NavigationLink(destination: Test5View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Basic Techniques", time: 2, category: "Food Prep")
                                }
                                
                                NavigationLink(destination: Test6View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Grilling", time: 2, category: "Food Prep")
                                }
                                
                                NavigationLink(destination: Test7View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Knife Skills", time: 2, category: "Food Prep")
                                }
                                
                                NavigationLink(destination: Test8View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Personal Hygiene", time: 2, category: "Safety")
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
                                                    .clipped()
                                                    .padding(.top, 10)
                                                    .foregroundStyle(.black)

                                                Spacer()

                                                NavigationLink(destination: LessonView()) {
                                                    // "See all" with right arrow icon
                                                    HStack {
                                                        Text("See all")
                                                            .font(.system(size: 25, weight: .bold, design: .rounded))
                                                            .frame(maxWidth: .infinity, alignment: .leading)
                                                            .clipped()
                                                            .padding(.top, 10)
                                                            .foregroundStyle(.black)
                                                            .padding(.leading, 40)
                                                        Image(systemName: "arrow.right")
                                                            .foregroundColor(.blue)
                                                            .font(.system(size: 25))
                                                            .padding(.top, 5)
                                                    }
                                                    .padding(.trailing)
                                                }
                                            }

                                            // display shortened list of available lessons
                                            LessonManager(length: 1)
                    }
                }
                .padding(.horizontal)
            
                .onAppear {
                   // print("HomeView loaded with username: \(userProgress.username)")
                    //displayedUsername = userProgress.username
                    userProgress.fetchUserData()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct TestCategoryCard: View {
    let title: String
    let time: Int
    let category: String
    
    var body: some View {
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


#Preview {
    HomeView()
}
