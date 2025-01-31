import SwiftUI

struct HomeView: View {
    @StateObject private var userProgress = UserProgress()
    @State private var userLevel: Int = 1

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Hi, Ruby!")   .font(.system(size: 39, weight: .light, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            .padding(.top, 10)
                            .foregroundStyle(.black)
                        
                        Image("ryan-walton-AbNO2iejoXA-unsplash")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding()
                        
                    } // end of HStack
                       
                    LevelView(level: $userLevel)
                
                    VStack(spacing: 16) {
                       /* Text("Test your knowledge".uppercased())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(.subheadline, weight: .medium))
                            .foregroundColor(.black)*/

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                NavigationLink(destination: Test1View(userProgress: userProgress)) {
                                    TestCategoryCard( title: "Tools")
                                }

                                NavigationLink(destination: Test2View(userProgress: userProgress)) {
                                    TestCategoryCard(title: "Ingredients")
                                }

                                NavigationLink(destination: Test3View(userProgress: userProgress)) {
                                    TestCategoryCard( title: "French Terms")
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

                        ScrollView(.horizontal, showsIndicators: false) {
                            VStack {
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
                                    
                                } //end of checking user level
                            } // end of vstack
                        } // end of scrollview
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
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                Text(title)
                    .font(.system(.largeTitle, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .padding(.leading, 20)
                Spacer()
            }
            .frame(width: 200, height: 270)
            .background(Color(red: 0.6, green: 0.7, blue: 1.0))
            .cornerRadius(20)
            
            Image(systemName: "play.circle")
                .foregroundStyle(.white)
                .font(.system(size: 70))
                .offset(x: 10, y: -19)
        }
        .frame(width: 200, height: 270) // Ensures correct sizing
    }
}

#Preview {
    HomeView()
}
