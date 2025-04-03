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
        VStack(spacing: 20) {
            Text("Congratulations!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("You've reached Level \(level)!")
                .font(.title2)
                .padding()
            
            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
