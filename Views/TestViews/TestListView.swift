import SwiftUI

struct TestListView: View {
    @EnvironmentObject private var userProgress: UserProgress
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Food Preparation Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Food Preparation")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(.black)
                            .padding(.top, 10)
                        
                        foodPrepManager()
                    }
                    .padding(.leading, 10)
                    
                    // Food Safety Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Food Safety")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(.black)
                            .padding(.top, 10)
                        
                        foodSafetyManager()
                    }
                    .padding(.leading, 10)
                    
                    // International Terms Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("International Terms")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(.black)
                            .padding(.top, 10)
                        
                        internationalTermsManager()
                    }
                    .padding(.leading, 10)
                }
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal, 0)
            }
            .padding(.horizontal, 0)
        }
    }
}

struct Test1View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Tools", userProgress: userProgress, concentration: "Food Preparation")
    }
}

struct Test2View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Ingredients", userProgress: userProgress, concentration: "Food Preparation")
    }
}

struct Test3View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "French Terms", userProgress: userProgress, concentration: "International")
    }
}

struct Test4View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Food Safety", userProgress: userProgress, concentration: "Safety")
    }
}

struct Test5View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Basic Cooking Techniques", userProgress: userProgress, concentration: "Food Preparation")
    }
}

struct Test6View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Grilling", userProgress: userProgress, concentration: "Food Preparation")
    }
}

struct Test7View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Knife Skills", userProgress: userProgress, concentration: "Food Preparation")
    }
}

struct Test8View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Personal Hygiene", userProgress: userProgress, concentration: "Safety")
    }
}

struct Test9View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Spanish Cooking", userProgress: userProgress, concentration: "International")
    }
}

struct Test10View: View {
    @ObservedObject var userProgress: UserProgress
    var body: some View {
        TestView(category: "Japanese Cooking", userProgress: userProgress, concentration: "International")
    }
}

struct foodPrepManager: View {
    @EnvironmentObject private var userProgress: UserProgress
    var filter: Int?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                if filter == 1 {
                    NavigationLink(destination: Test1View(userProgress: userProgress)) {
                        TestCategoryCard(filter: 1, title: "Tools", time: 5, category: "Food Prep", levelRequired: 1)
                    }
                    
                    NavigationLink(destination: Test2View(userProgress: userProgress)) {
                        TestCategoryCard(filter: 1, title: "Ingredients", time: 5, category: "Food Prep", levelRequired: 2)
                    }
                    
                    NavigationLink(destination: Test5View(userProgress: userProgress)) {
                        TestCategoryCard(filter: 1, title: "Basic Cooking Techniques", time: 2, category: "Food Prep", levelRequired: 1)
                    }
                    
                    NavigationLink(destination: Test6View(userProgress: userProgress)) {
                        TestCategoryCard(filter: 1, title: "Grilling", time: 2, category: "Food Prep", levelRequired: 1)
                    }
                    
                    NavigationLink(destination: Test7View(userProgress: userProgress)) {
                        TestCategoryCard(filter: 1, title: "Knife Skills", time: 2, category: "Food Prep", levelRequired: 1)
                    }
                } else {
                    NavigationLink(destination: Test1View(userProgress: userProgress)) {
                        TestCategoryCard(title: "Tools", time: 5, category: "Food Prep", levelRequired: 1)
                    }
                    
                    NavigationLink(destination: Test2View(userProgress: userProgress)) {
                        TestCategoryCard(title: "Ingredients", time: 5, category: "Food Prep", levelRequired: 2)
                    }
                    
                    NavigationLink(destination: Test5View(userProgress: userProgress)) {
                        TestCategoryCard(title: "Basic Cooking Techniques", time: 2, category: "Food Prep", levelRequired: 1)
                    }
                    
                    NavigationLink(destination: Test6View(userProgress: userProgress)) {
                        TestCategoryCard(title: "Grilling", time: 2, category: "Food Prep", levelRequired: 1)
                    }
                    
                    NavigationLink(destination: Test7View(userProgress: userProgress)) {
                        TestCategoryCard(title: "Knife Skills", time: 2, category: "Food Prep", levelRequired: 1)
                    }
                }
            }
            .padding(.leading, 10) 
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

struct foodSafetyManager: View {
    @EnvironmentObject private var userProgress: UserProgress
    var filter: Int?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                if filter == 1 {
                    NavigationLink(destination: Test8View(userProgress: userProgress)) {
                        TestCategoryCard(filter: 1, title: "Personal Hygiene", time: 2, category: "Safety", levelRequired: 1)
                    }
                    
                    NavigationLink(destination: Test4View(userProgress: userProgress)) {
                        TestCategoryCard(filter: 1, title: "Food Safety", time: 5, category: "Safety", levelRequired: 2)
                    }
                } else {
                    NavigationLink(destination: Test8View(userProgress: userProgress)) {
                        TestCategoryCard(title: "Personal Hygiene", time: 2, category: "Safety", levelRequired: 1)
                    }
                    
                    NavigationLink(destination: Test4View(userProgress: userProgress)) {
                        TestCategoryCard(title: "Food Safety", time: 5, category: "Safety", levelRequired: 2)
                    }
                }
            }
            .padding(.horizontal, 0)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct internationalTermsManager: View {
    @EnvironmentObject private var userProgress: UserProgress
    var filter: Int?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                if filter == 1 {
                   
                        NavigationLink(destination: Test3View(userProgress: userProgress)) {
                            TestCategoryCard(filter: 1, title: "French Terms", time: 5, category: "International", levelRequired: 3)
                        }
                  
                        NavigationLink(destination: Test9View(userProgress: userProgress)) {
                            TestCategoryCard(filter: 1, title: "Spanish Terms", time: 5, category: "International", levelRequired: 3)
                        }
                        NavigationLink(destination: Test10View(userProgress: userProgress)) {
                            TestCategoryCard(filter: 1, title: "Japanese Terms", time: 5, category: "International", levelRequired: 3)
                        }
                    
                } else {
                    if userProgress.currentLevel >= 2 {
                        NavigationLink(destination: Test3View(userProgress: userProgress)) {
                            TestCategoryCard(title: "French Terms", time: 5, category: "International", levelRequired: 3)
                        }
                    }
                    
                    if userProgress.currentLevel >= 3 {
                        NavigationLink(destination: Test9View(userProgress: userProgress)) {
                            TestCategoryCard(title: "Spanish Terms", time: 5, category: "International", levelRequired: 3)
                        }
                        NavigationLink(destination: Test10View(userProgress: userProgress)) {
                            TestCategoryCard(title: "Japanese Terms", time: 5, category: "International", levelRequired: 3)
                        }
                    }
                }
            }
            .padding(.horizontal, 0)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
