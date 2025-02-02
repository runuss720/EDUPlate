import SwiftUI

struct HomeView: View {
    @StateObject private var userProgress = UserProgress()
    @State private var userLevel: Int = 1

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
                            
                            // TODO: change to user name
                            Text("Hi, Ruby!")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .padding(.top, 10)
                                .foregroundStyle(.black)
                            
                            // Display level progress bar
                            LevelView(level: $userLevel)
                        }
                    }
                    
                    HStack {
                        Text("Dashboard")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            .padding(.top, 10)
                            .foregroundStyle(.black)
                    }
                    
                    VStack(spacing: 16) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                
                                // TODO: add to testmanager
                                NavigationLink(destination: Test1View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Tools", time: 5, imageName: "becca-tapert-hneG0Illco4-unsplash")
                                }

                                NavigationLink(destination: Test2View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Ingredients", time: 5, imageName: "ingredients-unsplash")
                                }

                                NavigationLink(destination: Test3View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "French Terms", time: 5, imageName: "jez-timms-DVRXFIH42d0-unsplash (1)")
                                }
                            }
                        }
                    }
                    Divider()
                        .padding(.vertical, 20)

                    VStack(spacing: 16) {
                        Text("Lessons")
                            .font(.system(.largeTitle, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            .padding(.bottom, 8)
                            .foregroundStyle(.indigo)

                        // display shortened list of available lessons
                        LessonManager(length: 1)
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
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
              .frame(width: 350, height: 100)
              .background(Color(red: 0.6, green: 0.7, blue: 1.1))
              .cornerRadius(20)
    }
}

struct TestCategoryCard: View {
    let title: String
    let time: Int
    let imageName: String // Now accepts an image name

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                Image(imageName)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 325, height: 200)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                    .offset(y: 2)

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
                
                Spacer()
            }
            .frame(width: 330, height: 320)
            .background(Color(red: 0.6, green: 0.7, blue: 1.1))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)

            Image(systemName: "play.circle")
                .foregroundStyle(.white)
                .font(.system(size: 70))
                .offset(x: 235, y: -19)
        }
        .frame(width: 330, height: 340)
    }
}

#Preview {
    HomeView()
}
