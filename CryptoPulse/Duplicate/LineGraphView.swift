//
//  LineGraphView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 22/11/2023.
//

import SwiftUI

struct LineGraphView: View {
    var data: [CGFloat] = [989, 1200, 750, 790, 650, 950, 1200, 600, 500, 600, 890, 1203, 1400, 900, 1250, 1600, 1200]
  
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                let height = proxy.size.height
                let width = proxy.size.width / CGFloat(data.count - 1)
                let maxPoint = (data.max() ?? 0)
                let minPoint = data.min() ?? 0
                let points = data.enumerated().compactMap { item -> CGPoint in
                    let progress = item.element / (maxPoint - minPoint)
                    
                    let pathHeight = progress * (height - 27)
                    let pathWidth = width * CGFloat(item.offset)
                    return CGPoint(x: pathWidth, y: -pathHeight + height)
                }
                
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLines(points)
                }
                .strokedPath(StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .fill(
                    Color.theme.red
                )
            }
        }
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .frame(height: 60)

    }
}

#Preview {
    LineGraphView()
}


