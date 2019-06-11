//
//  BarChartView.swift
//  BarGraph
//
//  Created by Iragam Reddy, Sreekanth Reddy on 4/23/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

struct BarData {
    let height: CGFloat
    let color: UIColor
}

class BarChartView: UIView {
    let barWidthSpace: CGFloat = 10.0
    var barData:[BarData] = [.init(height: 0.2,color: .red),.init(height: 1,color: .yellow),.init(height: 0.4,color: .gray),.init(height: 0.1,color: .green),.init(height: 0.8,color: .cyan),.init(height: 0.9,color: .red),.init(height: 0,color: .blue), .init(height: 0.6,color: .gray), .init(height: 0.5,color: .yellow)]
    let offSetTop: CGFloat = 30
    var seconds = 0.1
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        clipsToBounds = true
        addBars()
    }
    
    private func addBars() {
        let noOfBars: CGFloat = CGFloat(barData.count)
        let barWidthWithoutSpace = frame.width - (CGFloat(noOfBars-1) * barWidthSpace)
        let barWidth = CGFloat(barWidthWithoutSpace/noOfBars)
        barData.enumerated().forEach { (index, value) in
            let layer = CALayer()
            let xValue = (CGFloat(index)*(barWidth + barWidthSpace))
            let heightOffset = bounds.height - offSetTop
            let yValue = (heightOffset * (1.0 - value.height))
            let barHeight = (heightOffset * CGFloat(value.height))
            layer.frame = CGRect(x: xValue, y: yValue + offSetTop, width: barWidth, height: barHeight)
            layer.backgroundColor = value.color.cgColor
            let labelValue = UILabel(frame: CGRect(x: xValue, y: yValue+10, width: barWidth, height: 20))
            labelValue.text = value.height.description
            labelValue.textColor = .clear
            self.layer.addSublayer(layer)
            self.addSubview(labelValue)
            
    
            let position = CGPoint(x: layer.position.x, y: bounds.height + barHeight + 20)
            let toPosition = layer.position
            CATransaction.begin()
            CATransaction.setCompletionBlock({
                labelValue.textColor = .black
            })
            let anim = CABasicAnimation(keyPath: "position")
             seconds = seconds + 0.1
            anim.beginTime = CACurrentMediaTime() + seconds
            anim.fillMode = .backwards
            
            anim.duration = 0.3
            anim.fromValue = position
            anim.toValue = toPosition
            layer.add(anim, forKey: "position")
      
            CATransaction.commit()
    
        }
    }
    
    private func animateLayer(_ layer: CALayer, keyPath: String) {
        let anim = CABasicAnimation(keyPath: keyPath)
        anim.duration = 0.3
        anim.fromValue = 0.0
        anim.toValue = 1.0
        layer.add(anim, forKey: keyPath)
    }
}
