//
//  CoustomCharts.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 22/11/2023.
//

import SwiftUI
import Charts

struct CoustomCharts: View {
    var data: [CGFloat] = [989, 1200, 750, 790, 650, 950, 1200, 600, 500, 600, 890, 1203, 1400, 900, 1250, 1600, 1200]
    let coin: CoinModel
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width: CGFloat = geometry.size.width //* 9
                let height: CGFloat = geometry.size.height// * 3

                let normalizedData = self.normalizeData(chartHeight: height)

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
            .stroke((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
        }
        .frame(height: 44, alignment: .trailing) // Adjust the height as needed
        .frame(maxWidth: 90, alignment: .trailing)
        .padding(4)
    }

    private func normalizeData(chartHeight: CGFloat) -> [CGFloat] {
        let maxValue = data.max() ?? 1
        let minValue = data.min() ?? 0
        let range = maxValue - minValue
        let scaledData = data.map { value in
            (value - minValue) / range * chartHeight
        }
    
        // Adjust the scaling factor here to match the original chart's proportions
        let adjustedScaledData = scaledData.map { value in
            value * 0.9 // Adjust this value to fine-tune the scaling
        }
    
        return adjustedScaledData
    }
}

struct CoustomCharts_previews: PreviewProvider {
    static var previews: some View {
        CoustomCharts( coin: dev.coin)
    }
}
