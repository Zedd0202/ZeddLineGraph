//
//  ZeddLineGraphView.swift
//  ZeddLineGraphView
//
//  Created by Zedd on 2020/04/22.
//  Copyright © 2020 Zedd. All rights reserved.
//

import UIKit

class ZeddLineGraphView: UIView {
    
    var values: [CGFloat] = []
    
    var graphPath: UIBezierPath!
    var zeroPath: UIBezierPath!
    
    let graphLayer = CAShapeLayer()

    init(frame: CGRect, values: [CGFloat]) {
        super.init(frame: frame)
        self.values = values
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.graphPath = UIBezierPath()
        self.zeroPath = UIBezierPath()
        
        self.layer.addSublayer(graphLayer)

        let xOffset: CGFloat = self.frame.width / CGFloat(values.count)
        
        var currentX: CGFloat = 0
        let startPosition = CGPoint(x: currentX, y: self.frame.height)
        self.graphPath.move(to: startPosition)
        self.zeroPath.move(to: startPosition)
        
        for i in 0..<values.count {
            currentX += xOffset
            let newPosition = CGPoint(x: currentX,
                                      y: self.frame.height - self.values[i])
            self.graphPath.addLine(to: newPosition)
            self.zeroPath.addLine(to: CGPoint(x: currentX, y: self.frame.height))
        }
        
        graphLayer.fillColor = nil
        graphLayer.strokeColor = UIColor.black.cgColor
        graphLayer.lineWidth = 2
        
        let oldPath = self.zeroPath.cgPath
        let newPath = self.graphPath.cgPath
                
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = 1
        animation.fromValue = oldPath
        animation.toValue = newPath
        
        self.graphLayer.path = newPath
        self.graphLayer.add(animation, forKey: "path")
    }
}
