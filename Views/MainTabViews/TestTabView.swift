import SwiftUI

struct TestTabView: View {
    @StateObject private var userProgress = UserProgress()
    @State private var userLevel: Int = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack {
                            
                            // TODO: add to testmanager
                            NavigationLink(destination: Test1View(userProgress: userProgress)) {
                                TestCategoryCard2(title: "Tools", time: 5, category: "Food Prep")
                            }
                            
                            NavigationLink(destination: Test2View(userProgress: userProgress)) {
                                TestCategoryCard2(title: "Ingredients", time: 5, category: "Food Prep")
                            }
                            
                            NavigationLink(destination: Test3View(userProgress: userProgress)) {
                                TestCategoryCard2(title: "French Terms", time: 5, category: "International")
                            }
                            
                            NavigationLink(destination: Test4View(userProgress: userProgress)) {
                                TestCategoryCard2(title: "Food Safety", time: 5, category: "Safety")
                            }
                            
                            NavigationLink(destination: Test5View(userProgress: userProgress)) {
                                TestCategoryCard2(title: "Basic Techniques", time: 2, category: "Food Prep")
                            }
                            
                            NavigationLink(destination: Test6View(userProgress: userProgress)) {
                                TestCategoryCard2(title: "Grilling", time: 2, category: "Food Prep")
                            }
                            
                            NavigationLink(destination: Test7View(userProgress: userProgress)) {
                                TestCategoryCard2(title: "Knife Skills", time: 2, category: "Food Prep")
                            }
                            
                            NavigationLink(destination: Test8View(userProgress: userProgress)) {
                                TestCategoryCard2(title: "Personal Hygiene", time: 2, category: "Safety")
                            }
                            
                        }
                    }
                }
                Divider()
                    .padding(.vertical, 10)
            }
        }
    }
}

struct TestCategoryCard2: View {
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
            .frame(width: 330, height: 220)
            .background(Color(red: 0.6, green: 0.7, blue: 1.1))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            .padding(.leading, 140)

            Image(systemName: "play.circle")
                .foregroundStyle(.white)
                .font(.system(size: 70))
                .offset(x: 365, y: -19)
        }
        .frame(width: 230, height: 240)
    }
}

#Preview {
    TestTabView()
}

