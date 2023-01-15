//
//  ChartView.swift
//  SwiftUIBarChartDemo
//
//  Created by Thongchai Subsaidee on 15/1/23.
//

import SwiftUI
import Charts

enum ChartType: String {
    case AreaMark
    case LineMark
    case PointMark
    case RectangleMark
    case BarMark
}

struct ChartView: View {
    
    var viewMonths = [ViewMonth]()
    var chartType: ChartType = .BarMark
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            Text("YouTube Views")
            
            Text("Total: \(viewMonths.reduce(0, {$0 + $1.viewCount}))")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 12)
            
            Chart {
                RuleMark(y: .value("Goal", 80000))
                    .foregroundStyle(.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                
                ForEach(viewMonths) { ViewMonth in
                    
                    switch chartType {
                    case .AreaMark:
                        AreaMark(
                            x: .value("Month", ViewMonth.date, unit: .month),
                            y: .value("Views", ViewMonth.viewCount)
                        )
                        .foregroundStyle(.pink.gradient)
                    case .LineMark:
                        LineMark(
                            x: .value("Month", ViewMonth.date, unit: .month),
                            y: .value("Views", ViewMonth.viewCount)
                        )
                        .foregroundStyle(.pink.gradient)
                    case .PointMark:
                        PointMark(
                            x: .value("Month", ViewMonth.date, unit: .month),
                            y: .value("Views", ViewMonth.viewCount)
                        )
                        .foregroundStyle(.pink.gradient)
                    case .RectangleMark:
                        RectangleMark (
                            x: .value("Month", ViewMonth.date, unit: .month),
                            y: .value("Views", ViewMonth.viewCount)
                        )
                        .foregroundStyle(.pink.gradient)
                    case .BarMark :
                        BarMark(
                            x: .value("Month", ViewMonth.date, unit: .month),
                            y: .value("Views", ViewMonth.viewCount)
                        )
                        .foregroundStyle(.pink.gradient)
                    }

                }
            }
            .frame(height: 180)
            .chartXAxis {
                AxisMarks(values: viewMonths.map{$0.date}) { date in
                    AxisValueLabel(format: .dateTime.month())
                }
            }
            .padding(.bottom)
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            HStack {
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.mint)
                Text("Monthly Goal")
                    .foregroundColor(.secondary)
            }
            .font(.caption2)
            .padding(.leading, 4)
        }
        .padding()
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
