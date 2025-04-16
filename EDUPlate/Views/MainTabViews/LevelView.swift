import SwiftUI

struct LevelView: View {
    @EnvironmentObject private var userProgress: UserProgress
    @Binding var level: Int
    @State private var showLevelUpView = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(.systemGray6))
                        .frame(width: 250, height: 19)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.indigo.gradient)
                        .frame(
                            width: CGFloat(userProgress.currentPoints) / CGFloat(userProgress.pointsToLevelUp) * 250,
                            height: 16
                        )
                }
                .offset(x: -6)
            }
        }
        .onAppear {
            level = userProgress.currentLevel
        }
        .onChange(of: userProgress.currentLevel) {
               if userProgress.currentLevel > level {
                   level = userProgress.currentLevel
                   showLevelUpView = true
               }
           }


        .padding(.bottom)
        .sheet(isPresented: $showLevelUpView) {
            LevelUpView(level: userProgress.currentLevel)
        }
    }
}

struct LevelUpView: View {
    var level: Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 25) {
            Text("🎉 Congratulations! 🎉")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("You've reached **Level \(level)!**")
                .font(.title2)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            if level >= 4 {
                VStack(spacing: 12) {
                    Text("That's all for now! Stay tuned for more content in the future!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                .padding(.top, 10)
                
                Divider()
            }
            else if level >= 3 {
                VStack(spacing: 12) {
                    Text("🔓 New Features Unlocked!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Group {
                            Text("✅ Spanish Terms Quiz")
                            Text("✅ Japanese Terms Quiz")
                            Text("✅ French Terms Quiz")
                            Text("✅ Stocks Lesson")
                        }
                        .font(.body)
                        .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 10)
                
                Divider()
            }
            else if level >= 2 {
                VStack(spacing: 12) {
                    Text("🔓 New Features Unlocked!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Group {
                            Text("✅ Food Safety Quiz")
                            Text("✅ Ingredients Quiz")
                            Text("✅ Grilling Quiz")
                            Text("✅ Soups Lesson")
                            Text("✅ Grilling Lesson")
                            Text("✅ Food Safety Lesson")
                        }
                        .font(.body)
                        .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 10)
                
                Divider()
            }
    
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Text("Close")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.indigo)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
