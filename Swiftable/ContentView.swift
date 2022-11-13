//
//  ContentView.swift
//  Swiftable
//
//  Created by Erick Yamat on 25/10/22.
//

import SwiftUI
import Charts

struct ChartData: Identifiable {
    let id = UUID()
    let value: Double
    let month: Date
}


struct ContentView: View {
    @State private var range: (Date, Date)? = nil
    
    let data: [ChartData] = [
        ChartData(value: 300, month: date(year: 2022, month: 9, day: 2)),
        ChartData(value: 100, month: date(year: 2022, month: 10, day: 2)),
        ChartData(value: 250, month: date(year: 2022, month: 11, day: 2)),
        ChartData(value: 80, month: date(year: 2022, month: 12, day: 2))
    ]
    
    var body: some View {
        GroupBox(String()) {
            Text("BarMark")
            Chart {
                ForEach(data, id: \.month) {
                    BarMark(x: .value("Date", $0.month, unit: .month),
                            y: .value("Steps", $0.value))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
        }
    }
}

func date(year: Int,
          month: Int,
          day: Int = 1) -> Date {
    Calendar.current.date(from: DateComponents(year: year,
                                               month: month,
                                               day: day)) ?? Date()
}
