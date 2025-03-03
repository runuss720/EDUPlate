import SwiftUI
import Charts

struct ChartData: Identifiable {
    let id = UUID()
    let score: Int
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
    @StateObject private var testManager = TestManager(userProgress: UserProgress())
    
    @State private var vocabOfTheDay: Question? = nil
    
    // Define a color palette for various shades of indigo
    let indigoShades: [Color] = [
        Color(red: 0.6, green: 0.7, blue: 1.1), // Dark Indigo
        Color(red: 0.7, green: 0.8, blue: 1.2), // Medium Indigo
        Color(red: 0.8, green: 0.9, blue: 1.3), // Light Indigo
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            HStack {
                Text("Your Stats")
                    .font(.largeTitle)
                    .foregroundStyle(.indigo)
                Spacer() // Pushes text to the left
            }
            .padding(.top, -90) // Adjusted spacing from top
            
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
            .chartForegroundStyleScale(range: indigoShades) // Apply custom indigo shades
            .frame(height: 300)
            .padding(.top, 20)
            
            // "Vocab of the Day" Section
                       if let vocab = vocabOfTheDay {
                           VStack(alignment: .leading) {
                               Text("Vocab of the Day")
                                   .font(.system(size: 20, weight: .bold))
                                   .foregroundStyle(.white)
                                   .padding(.top)
                                   .padding(.leading)
                               
                               Text(vocab.question)
                                   .font(.title2)
                                   .foregroundStyle(.white)
                                   .padding(.leading, 20)
                               
                               Text(vocab.answer)
                                   .font(.title3)
                                   .foregroundStyle(.white.opacity(0.8))
                                   .padding(.leading, 20)
                           }
                           .frame(width: 330, height: 180)
                           .background(Color(red: 0.6, green: 0.7, blue: 1.1))
                           .cornerRadius(20)
                           .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                           .padding(.top, 20)
            }
        }
        .padding()
        .onAppear {
            vm.loadScores() // Load chart data when the view appears
            userProgress.fetchUserData()
            vocabOfTheDay = testManager.fetchRandomQuestion()
        }
    }
}

#Preview {
    StatsView(userProgress: UserProgress())
}
