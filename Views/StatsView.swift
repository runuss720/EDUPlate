import SwiftUI
import Charts

struct ChartData: Identifiable {
    let id = UUID()
    let score: Int
    let index: Int
}

class ChartViewModel: ObservableObject {
    @Published var chartData = [ChartData]()

    // Load scores from the file and convert them into ChartData
    func loadScores() {
        let fileManagerHelper = FileManagerHelper()
        let scores = fileManagerHelper.loadScoresFromFile()

        // Convert the scores into ChartData
        chartData = scores.enumerated().map { index, score in
            ChartData(score: score.score, index: index)
        }

        // Sort by index in ascending order
        chartData.sort { $0.index < $1.index }
    }
}

struct StatsView: View {
    @ObservedObject var userProgress: UserProgress // Use UserProgress instead of TestManager
    @StateObject var vm = ChartViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            // Display user level and current points
            VStack(alignment: .leading, spacing: 8) {
                Text("Your Stats")
                    .font(.largeTitle)
                    .padding(.bottom, 8)
                    .foregroundStyle(.indigo)
            }
            .padding(.leading)

            // Line Chart for past scores
            Chart(vm.chartData) { item in
                LineMark(
                    x: .value("Attempt", item.index + 1),
                    y: .value("Score", item.score)
                )
                .foregroundStyle(.indigo)
                .lineStyle(StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            }
            .frame(height: 200)
            .padding(.bottom, 20)
            
            Text("Your progress will be tracked here. Keep practicing to see your scores improve! Level up by earning points from quizzes.")
                .font(.system(size: 20))
                .padding(.leading)
                .foregroundStyle(.black)
        }
        .padding()
        .onAppear {
            vm.loadScores()
        }
    }
}

#Preview {
    StatsView(userProgress: UserProgress())
}
