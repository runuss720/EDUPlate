import SwiftUI

struct LevelView: View {
    @StateObject private var userProgress = UserProgress()
    @Binding var level: Int // Dynamic level, passed from parent view
    @State private var totalPoints: Int = 0

    private func loadTotalPoints() {
        let fileManagerHelper = FileManagerHelper()
        let scores = fileManagerHelper.loadScoresFromFile()

        // Sum the scores
        totalPoints = scores.reduce(0) { $0 + $1.score }
    }

    private func checkLevelUp() {
        if totalPoints >= 300 {
            totalPoints -= 300
            level += 1
        }
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(.systemGray6))
                        .frame(width: 250, height: 19)

                    RoundedRectangle(cornerRadius: 5)
                        .fill(.indigo.gradient)
                        .frame(width: CGFloat(totalPoints) / 300 * 260, height: 16) // Adjusted width dynamically
                }
                .offset(x: -6)
            }
        }
        .onAppear {
            loadTotalPoints()
            checkLevelUp()
        }
        .padding(.bottom)
    }
}

