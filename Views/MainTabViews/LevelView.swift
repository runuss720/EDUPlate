import SwiftUI

// Displays a visual representation of user's level/progress
// Each time the user scores points, the bar will fill up slightly
struct LevelView: View {
    @EnvironmentObject private var userProgress: UserProgress
    @Binding var level: Int
    
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
        .padding(.bottom)
    }
}
