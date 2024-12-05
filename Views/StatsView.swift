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
    let views: Int
    let date: Date
}

class ChartViewModel: ObservableObject {
    @Published var chartData = [ChartData]()

    // Generate chart data for the last 3 days, using today's score
    func generateChartData(todayScore: Int) {
        var tempChartData = [ChartData]()
        
        // Loop through the last 3 days (including today)
        for i in 0..<3 {
            let date = Calendar.current.date(byAdding: .day, value: -i, to: .now)!
            
            // Set today's score at 0 for testing
            let views = (i == 0) ? todayScore : 0
            
            let chartItem = ChartData(views: views, date: date)
            tempChartData.append(chartItem)
        }
        
        // Reverse the data to make it in chronological order
        chartData = tempChartData.reversed()
    }
}

struct StatsView: View {
    @ObservedObject var testManager: TestManager  // Use @ObservedObject to observe the passed instance
    @StateObject var vm = ChartViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Current Score: \(testManager.score)")
                Text("Ruby's Progress")
                    .font(.title)
                    .padding()
                    .foregroundStyle(.pink)
            }
            // Bar Chart
            Chart(vm.chartData) { item in
                BarMark(
                    x: .value("Date", item.date, unit: .day),
                    y: .value("Views", item.views)
                )
                .foregroundStyle(.pink)
                .cornerRadius(5)
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
            print("StatsView appeared")
            // Generate chart data with today's score
            vm.generateChartData(todayScore: testManager.score)
            print("Chart data generated with score: \(testManager.score)")
        }
    }
}

#Preview {
    StatsView(testManager: TestManager())  
}
