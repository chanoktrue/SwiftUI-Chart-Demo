//
//  ContentView.swift
//  SwiftUIBarChartDemo
//
//  Created by Thongchai Subsaidee on 15/1/23.
//

import SwiftUI

struct ContentView: View {
    
    let viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 2, day: 1), viewCount: 89000),
        .init(date: Date.from(year: 2023, month: 3, day: 1), viewCount: 64000),
        .init(date: Date.from(year: 2023, month: 4, day: 1), viewCount: 79000),
        .init(date: Date.from(year: 2023, month: 5, day: 1), viewCount: 130000),
        .init(date: Date.from(year: 2023, month: 6, day: 1), viewCount: 90000),
        .init(date: Date.from(year: 2023, month: 7, day: 1), viewCount: 88000),
        .init(date: Date.from(year: 2023, month: 8, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 9, day: 1), viewCount: 64000),
        .init(date: Date.from(year: 2023, month: 10, day: 1), viewCount: 99000),
        .init(date: Date.from(year: 2023, month: 11, day: 1), viewCount: 11000),
        .init(date: Date.from(year: 2023, month: 12, day: 1), viewCount: 94000)
    ]
    
    var body: some View {
        ScrollView {
            VStack{
                ChartView(viewMonths: viewMonths, chartType: .AreaMark, title: "YouTube Views")
                
                ChartView(viewMonths: viewMonths, chartType: .LineMark, title: "YouTube Views")
                
                ChartView(viewMonths: viewMonths, chartType: .PointMark, title: "YouTube Views")
                
                ChartView(viewMonths: viewMonths, chartType: .RectangleMark, title: "YouTube Views")
                
                ChartView(viewMonths: viewMonths, chartType: .BarMark, title: "YouTube Views")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
