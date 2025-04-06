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

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                // Only show if levelRequired <= userProgress.currentLevel
                                if 1 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test1View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Tools", time: 5, category: "Food Prep", levelRequired: 1)
                                    }
                                }

                                if 2 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test2View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Ingredients", time: 5, category: "Food Prep", levelRequired: 1)
                                    }
                                }

                                if 1 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test5View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Basic Cooking Techniques", time: 2, category: "Food Prep", levelRequired: 1)
                                    }
                                }

                                if 2 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test6View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Grilling", time: 2, category: "Food Prep", levelRequired: 1)
                                    }
                                }

                                if 1 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test7View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Knife Skills", time: 2, category: "Food Prep", levelRequired: 1)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                    }

                    // Food Safety Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Food Safety")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(.black)
                            .padding(.top, 10)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                if 1 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test8View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Personal Hygiene", time: 2, category: "Safety", levelRequired: 1)
                                    }
                                }

                                if 2 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test4View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Food Safety", time: 5, category: "Safety", levelRequired: 1)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                    }

                    // International Terms Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("International Terms")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(.black)
                            .padding(.top, 10)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                if 1 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test3View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "French Terms", time: 5, category: "International", levelRequired: 1)
                                    }
                                }

                                if 3 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test9View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Spanish Terms", time: 5, category: "International", levelRequired: 3)
                                    }
                                }

                                if 3 <= userProgress.currentLevel {
                                    NavigationLink(destination: Test10View(userProgress: userProgress)) {
                                        TestCategoryCard(title: "Japanese Terms", time: 5, category: "International", levelRequired: 3)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                    }

                    Divider()
                        .padding(.vertical, 10)
                }
                .padding(.horizontal, 16)
            }
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
