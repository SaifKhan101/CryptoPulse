//
//  ChartView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 16/11/2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    var data: [CGFloat] = [50, 100, 75, 125, 80, 110] // Sample data points

    
    var body: some View {
      
            VStack(alignment: .center) {
                GeometryReader { geometry in
                    Path { path in
                        let width: CGFloat = geometry.size.width
                        let height: CGFloat = geometry.size.height
                        
                        // Normalize data points to fit the chart height
                        let normalizedData = self.normalizeData(data: self.data, chartHeight: height)
                        
                        for (index, value) in normalizedData.enumerated() {
                            let x = width / CGFloat(self.data.count - 1) * CGFloat(index)
                            let y = height - value
                            
                            if index == 0 {
                                path.move(to: CGPoint(x: x, y: y))
                            } else {
                                path.addLine(to: CGPoint(x: x, y: y))
                            }
                        }
                    }
                    .stroke(Color.blue, lineWidth: 2)
                    
                }
                .scaledToFit()
                .frame(height: 50, alignment: .center)
                
            }
           
//            .frame(maxHeight: 40)
            .padding()
           
        }
    
    private func normalizeData(data: [CGFloat], chartHeight: CGFloat) -> [CGFloat] {
        // Normalize data points to fit the chart height
        let maxValue = data.max() ?? 1
        return data.map { value in
            (value / maxValue) * chartHeight
        }
    }
}
#Preview {
   ChartView()
}

struct LineChartOFViewCoin: View {
    let coin: CoinModel
    var body: some View {
//        ChartView(data: sparklineData.price!.map{CGFloat($0)})
        if let sparklineData = coin.sparklineIn7D {
            ChartView(data: sparklineData.price!.map{CGFloat($0)})
//            LineGraphView(data: sparklineData.price!.map{CGFloat($0)})
        } else {
            Text("No data available")
        }
    }
}
//struct DataPoint: Identifiable {
//    let x: Double
//    let y: Double
//    
//    var id: Double {
//        return x
//    }
//}
//
//struct ContentView: View {
//    let dataPoints = [
//        DataPoint(x: 1.0, y: 2.0),
//        DataPoint(x: 2.0, y: 3.0),
//        DataPoint(x: 3.0, y: 5.0),
//        DataPoint(x: 4.0, y: 4.0),
//        DataPoint(x: 5.0, y: 6.0)
//    ]
//    
//    var body: some View {
//        Chart(dataPoints) { dataPoint in
//            LineMark(
//                x: .value("X", dataPoint.x),
//                y: .value("Y", dataPoint.y)
//            )
//        }
//        .chartStyle(ChartStyle(
//            lineStyle: LineStyle(lineWidth: 2),
//            pointStyle: PointStyle(fillColor: .blue),
//            xAxis: AxisStyle(title: Text("X Axis")),
//            yAxis: AxisStyle(title: Text("Y Axis"))
//        ))
//    }
//}


