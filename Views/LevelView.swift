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
            HStack {
                Text("Level: \(level)")
                    .font(.system(.largeTitle, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipped()
                    .padding(.bottom, 8)
                    .foregroundStyle(.indigo)
            }

            VStack(alignment: .leading) {

                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color(.systemGray6))
                        .frame(width: 250, height: 12)

                    RoundedRectangle(cornerRadius: 3)
                        .fill(.indigo.gradient)
                        .frame(width: CGFloat(totalPoints) / 300 * 250, height: 12)
                }
            }
        }
        .onAppear {
            loadTotalPoints()
            checkLevelUp()
        }
        .padding(.bottom)
    }
}

