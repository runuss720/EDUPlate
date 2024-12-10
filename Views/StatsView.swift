//
//  StatsView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/17/24.
//

import SwiftUI
import Charts

struct ChartData: Identifiable {
    let id = UUID()
    let score: Int
    //let date: Date
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
        // Sort by date in ascending order
        chartData.sort { $0.index < $1.index }
    }
}

struct StatsView: View {
    @ObservedObject var testManager: TestManager
    @StateObject var vm = ChartViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                //Text("Current Score: \(testManager.score)")
                Text("Your Accuracy")
                    .font(.title)
                    .padding()
                    .foregroundStyle(.pink)
            }
            
            // Line Chart
            Chart(vm.chartData) { item in
                LineMark(
                    x: .value("Date", item.index),
                    y: .value("Score", item.score)
                )
                .foregroundStyle(.pink)
                .lineStyle(StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            }
            .frame(height: 200)
            .padding(.bottom, 20)
            
            // Level text
            Text("Your progress will be kept here, make sure to check in often to see your improvement! Future updates will let you level up, so stay tuned.")
                .font(.system(size: 25))
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
    StatsView(testManager: TestManager())
}
