import SwiftUI
import Charts

struct ChartData: Identifiable {
    let id = UUID()
    let score: Int
    //let index: Int
    let concentration: String
}

class ChartViewModel: ObservableObject {
    @Published var chartData = [ChartData]()

    func loadScores() {
        let fileManagerHelper = FileManagerHelper()
        let scores = fileManagerHelper.loadScoresFromFile()
        
        print("Loaded scores: \(scores)") // Debugging: Print loaded scores
        
        // Aggregate scores by concentration
        var concentrationScores = [String: Int]()
        for score in scores {
            let concentration = score.concentration
            concentrationScores[concentration] = (concentrationScores[concentration] ?? 0) + score.score
        }

        // Convert the aggregated scores into ChartData
        chartData = concentrationScores.map { concentration, totalScore in
            ChartData(score: totalScore, concentration: concentration)
        }
        
        print("Chart data: \(chartData)") // Debugging: Print chart data
    }
}

struct StatsView: View {
    @ObservedObject var userProgress: UserProgress
    @StateObject var vm = ChartViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Stats")
                .font(.largeTitle)
                .padding(.bottom, 8)
                .foregroundStyle(.indigo)

            // Pie Chart for concentration scores
            Chart(vm.chartData) { item in
                SectorMark(
                    angle: .value("Score", item.score),
                    innerRadius: .ratio(0.5), // Optional: for a donut chart effect
                    angularInset: 1.5
                )
                .foregroundStyle(by: .value("Concentration", item.concentration))
                .cornerRadius(5)
                .annotation(position: .overlay) {
                    Text("\(item.score)")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
            }
            .frame(height: 300)
            .padding(.bottom, 20)
            .frame(height: 300)
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
