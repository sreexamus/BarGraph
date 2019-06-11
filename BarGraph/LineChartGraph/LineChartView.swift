//
//  LineChartView.swift
//  BarGraph
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/16/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class LineChartView: UIView {
    private var percentile: CGFloat = 0.5
    private var lines: [CGPoint] = [CGPoint(x: 0.6, y: 0.5)]
    private var pos: Double = 0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // Drawing code
        setupViews()
    }
    
    func setupViews() {
        if layer.sublayers == nil {
            lines.forEach { line in
                let newLayer = CAShapeLayer()
                layer.addSublayer(newLayer)
            }
            
            let fillLayer = CAShapeLayer()
            fillLayer.zPosition = -10
            layer.addSublayer(fillLayer)
            
            let originLayer = CAShapeLayer()
            originLayer.zPosition = 10
            layer.addSublayer(originLayer)
        }
        updateLayers()
        
    }
    
    private func updateLayers() {
        guard let shapeLayers = layer.sublayers as? [CAShapeLayer] else { return }
        
        zip(lines, shapeLayers.dropLast(2)).forEach { unitPoint, layer in
            let line = scaledPoint(point: unitPoint)
            let percentile = self.percentile
            
            layer.strokeColor = colorFor(percentile: Double(percentile))
            layer.zPosition = percentile == 0.25 ? 5 : 0
            layer.lineDashPattern = percentile == 0.25 ? nil : [5,5]
            layer.lineWidth = 2
            layer.fillColor = nil
            layer.path = pathFrom([line])?.cgPath
            
            //          To animate, or not to animate, that is the question,
            //          This would animate the percentage of the line that is visible from left to right
            //            animateLayer(layer, keyPath: "strokeEnd")
            
        }
        
//        if let fillLayer = shapeLayers.dropLast().last {
//            fillLayer.fillColor = UIColor(white: 1.0, alpha: 0.1).cgColor  // Lighten the background color for fill
//            
//            let firstLine: [CGPoint] = lines.first.map { self.scaledPoint(point: $0) } ?? []
//            let lastLine: [CGPoint] = lines.last.dataPoints.map { self.scaledPoint(point: $0) } ?? []
//            let fullline = firstLine.reversed() + lastLine
//            fillLayer.path = pathFrom(fullline, filledPath: true)?.cgPath
//            
//            //          This would animate in the appearance of the fill layer
//            //            animateLayer(fillLayer, keyPath: "opacity")
//        }
//        if let originLayer = shapeLayers.last {
//            let originPoint = scaledPoint(point: lines.first.dataPoints.first ?? .zero)
//            originLayer.fillColor = colorFor(percentile: 0.25)
//            originLayer.path = UIBezierPath(arcCenter: originPoint, radius: 3.0, startAngle: 0, endAngle: .pi*2, clockwise: true).cgPath
//        }
    }
    
    private func animateLayer(_ layer: CALayer, keyPath: String) {
        let anim = CABasicAnimation(keyPath: keyPath)
        anim.duration = 0.6
        anim.fromValue = 0.0
        anim.toValue = 1.0
        layer.add(anim, forKey: keyPath)
    }
    
    private func pathFrom(_ points: [CGPoint], filledPath: Bool = true) -> UIBezierPath? {
        guard points.count > 0, let fistPoint = points.first else { return nil }
        let path = UIBezierPath()
        path.move(to: fistPoint)
        points.forEach { point in
            path.addLine(to: point)
        }
        
        if filledPath {
            path.addLine(to: CGPoint(x: points.last?.x ?? frame.width, y: frame.height))
        }
        return path
    }
    
    // Take the unit values for the point and convert to the scale of the view bounds so that it can be "Plotted" into the view at any size
    private func scaledPoint(point: CGPoint) -> CGPoint {
        print("scaledPoint points are .......")
        print("point.x, y .......x- \(point.x) y- \(point.y)")
        print("scaledPoint point .......x- \(point.x * bounds.width) y- \(bounds.height - point.y * bounds.height)")
        return CGPoint(x: point.x * bounds.width, y: bounds.height - point.y * bounds.height)
    }
    
    private func colorFor(percentile: Double) -> CGColor {
        switch percentile {
        case 0.25 :
            return UIColor.red.cgColor
        case 0.5 :
            return UIColor.yellow.cgColor
        default:
            return UIColor.white.cgColor
        }
    }
}
