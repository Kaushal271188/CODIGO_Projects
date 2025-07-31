//
//  ChartView.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 30/07/25.
//

import Foundation

import UIKit

// Generic chart data entry
struct ChartDataEntry {
    let label: String
    let value: CGFloat
}

//Define ChartType Enum
enum ChartType {
    case bar
    case line
    case pie
}

class ChartView: UIView {

    var dataEntries: [ChartDataEntry] = []
    var chartType: ChartType = .bar
    var barColor: UIColor = .systemBlue
    var lineColor: UIColor = .systemRed
    var pieColors: [UIColor] = [.systemBlue, .systemGreen, .systemOrange, .systemPink]

    init(frame: CGRect, dataEntries: [ChartDataEntry], chartType: ChartType) {
        self.dataEntries = dataEntries
        self.chartType = chartType
        super.init(frame: frame)
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard !dataEntries.isEmpty else { return }

        switch chartType {
        case .bar:
            drawBarChart(in: rect)
        case .line:
            drawLineChart(in: rect)
        case .pie:
            drawPieChart(in: rect)
        }
    }
}

extension ChartView {
    
    private func drawBarChart(in rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let maxValue = dataEntries.map { $0.value }.max() ?? 1
        let barWidth = rect.width / CGFloat(dataEntries.count * 2)
        
        for (index, entry) in dataEntries.enumerated() {
            let x = CGFloat(index) * barWidth * 2 + barWidth / 2
            let heightRatio = entry.value / maxValue
            let barHeight = rect.height * heightRatio
            let y = rect.height - barHeight
            
            let barRect = CGRect(x: x, y: y, width: barWidth, height: barHeight)
            context?.setFillColor(barColor.cgColor)
            context?.fill(barRect)
        }
    }

    private func drawLineChart(in rect: CGRect) {
        guard dataEntries.count > 1 else { return }
        let path = UIBezierPath()
        let maxValue = dataEntries.map { $0.value }.max() ?? 1
        let spacing = rect.width / CGFloat(dataEntries.count - 1)

        for (i, entry) in dataEntries.enumerated() {
            let x = CGFloat(i) * spacing
            let y = rect.height - (entry.value / maxValue) * rect.height
            let point = CGPoint(x: x, y: y)

            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }

        lineColor.setStroke()
        path.lineWidth = 2
        path.stroke()
    }

    private func drawPieChart(in rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let total = dataEntries.reduce(0) { $0 + $1.value }
        var startAngle = CGFloat(-Float80.pi / 2)

        for (index, entry) in dataEntries.enumerated() {
            context?.setFillColor(pieColors[index % pieColors.count].cgColor)

            let endAngle = startAngle + 2 * .pi * (entry.value / total)
            context?.move(to: CGPoint(x: rect.midX, y: rect.midY))
            context?.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                            radius: min(rect.width, rect.height) / 2,
                            startAngle: startAngle,
                            endAngle: endAngle,
                            clockwise: false)
            context?.fillPath()
            startAngle = endAngle
        }
    }
}
