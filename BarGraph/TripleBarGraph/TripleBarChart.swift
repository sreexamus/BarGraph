//
//  TripleBarChart.swift
//  BarGraph
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/5/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class TripleBarChart: UIView {
    
    let barWidthSpace: CGFloat = 10.0
    var firstBarData:[BarData] = [.init(height: 0.2,color: .red),.init(height: 0.33,color: .yellow),.init(height: 0.23,color: .white),.init(height: 0.1,color: .cyan),.init(height: 0.15,color: .cyan),.init(height: 0.26,color: .red),.init(height: 0.2,color: .green), .init(height: 0.13,color: .white), .init(height: 0.19,color: .red), .init(height: 0.06,color: .gray)]
     var secondBarData:[BarData] = [.init(height: 0.37,color: .green),.init(height: 0.45,color: .cyan),.init(height: 0.40,color: .gray),.init(height: 0.42,color: .yellow),.init(height: 0.52,color: .green),.init(height: 0.6,color: .yellow),.init(height: 0.48,color: .red), .init(height: 0.53,color: .yellow), .init(height: 0.67,color: .yellow), .init(height: 0.41,color: .yellow)]
    var thirdBarData:[BarData] = [.init(height: 0.69,color: .yellow),.init(height: 0.72,color: .blue),.init(height: 0.78,color: .cyan),.init(height: 0.87,color: .green),.init(height: 0.90,color: .yellow),.init(height: 0.80,color: .green),.init(height: 0.79,color: .blue), .init(height: 0.86,color: .gray), .init(height: 0.93,color: .green), .init(height: 0.95,color: .green)]
 
    override func draw(_ rect: CGRect) {
       setupViews()
    }
    
    func setupViews() {
        let noOfBars  = firstBarData.count + secondBarData.count + thirdBarData.count
        let barsPerYear = CGFloat(noOfBars/3)
        let barWidthWithoutSpace = frame.width - (CGFloat(barsPerYear-1) * barWidthSpace)
        let barWidth = CGFloat(barWidthWithoutSpace/barsPerYear)
        
        (0...Int(barsPerYear-1)).forEach { index in
            (0...2).forEach({ barIndex in
                 let xValue = (CGFloat(index)*(barWidth + barWidthSpace))
               
                switch barIndex {
                case 0:
                    let firstLayer = CALayer()
                    let frameHeight = bounds.height * (1 - firstBarData[index].height)
                     let yValue =  bounds.height - frameHeight
                    firstLayer.frame = CGRect(x: xValue, y: yValue, width: barWidth, height: frameHeight)
                    firstLayer.backgroundColor = firstBarData[index].color.cgColor
                    firstLayer.cornerRadius = barWidth/2
                    layer.addSublayer(firstLayer)
                case 1:
                    let secondLayer = CALayer()
                    let secondHeight = bounds.height * (1 - secondBarData[index].height)
                    let yValue =  bounds.height - secondHeight
                    secondLayer.frame = CGRect(x: xValue, y: yValue, width: barWidth, height: secondHeight)
                    secondLayer.backgroundColor = secondBarData[index].color.cgColor
                    secondLayer.cornerRadius = barWidth/2
                    layer.addSublayer(secondLayer)
                case 2:
                    let thirdLayer = CALayer()
                    thirdLayer.cornerRadius = barWidth/2
                    let thirdHeight = bounds.height * (1 - thirdBarData[index].height)
                     let yValue =  bounds.height - thirdHeight
                    thirdLayer.frame = CGRect(x: xValue, y: yValue, width: barWidth, height: thirdHeight)
                    thirdLayer.backgroundColor = thirdBarData[index].color.cgColor
                    layer.addSublayer(thirdLayer)
                default: break
                }
            })
        }
    }
}
