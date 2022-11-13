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
    var type: String
}


struct ContentView: View {
    @State private var range: (Date, Date)? = nil
    
    let data: [ChartData] = [
        ChartData(value: 5,
                  month: date(year: 2022, month: 9, day: 2),
                  type: "Erick Steps"),
        ChartData(value: 4,
                  month: date(year: 2022, month: 10, day: 2),
                  type: "Erick Steps"),
        ChartData(value: 7,
                  month: date(year: 2022, month: 11, day: 2),
                  type: "Erick Steps"),
        ChartData(value: 15,
                  month: date(year: 2022, month: 12, day: 2),
                  type: "Erick Steps"),
        ChartData(value: 15,
                  month: date(year: 2022, month: 9, day: 2),
                  type: "Ceci Steps"),
        ChartData(value: 14,
                  month: date(year: 2022, month: 10, day: 2),
                  type: "Ceci Steps"),
        ChartData(value: 17,
                  month: date(year: 2022, month: 11, day: 2),
                  type: "Ceci Steps"),
        ChartData(value: 25,
                  month: date(year: 2022, month: 12, day: 2),
                  type: "Ceci Steps")
        
    ]
    
    var body: some View {
        GroupBox(String()) {
            Text("AreaMark")
            Chart {
                ForEach(data, id: \.month) {
                    AreaMark(x: .value("Date", $0.month, unit: .month),
                            y: .value("Steps", $0.value))
                    .foregroundStyle(by: .value("Type", "\($0.type)"))
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
