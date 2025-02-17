import SwiftUI

struct LevelView: View {
    @EnvironmentObject private var userProgress: UserProgress // Use EnvironmentObject
    @Binding var level: Int // Dynamic level, passed from parent view

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    // Background of the progress bar
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(.systemGray6))
                        .frame(width: 250, height: 19)

                    // Foreground of the progress bar (dynamic width)
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
            // Update the level binding to match the current level in UserProgress
            level = userProgress.currentLevel
        }
        .padding(.bottom)
    }
}
