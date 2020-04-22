//
//  ZeddLineGraphView.swift
//  ZeddLineGraphView
//
//  Created by Zedd on 2020/04/22.
//  Copyright © 2020 Zedd. All rights reserved.
//

import UIKit

class ZeddLineGraph: UIView {
    
    var values: [CGFloat] = []
    
    init(frame: CGRect, values: [CGFloat]) {
        super.init(frame: frame)
        self.values = values
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let layer = CAShapeLayer()
        let path = UIBezierPath()

        let xOffset: CGFloat = self.frame.width / CGFloat(values.count)
        
        var currentX: CGFloat = 0
        path.move(to: CGPoint(x: currentX, y: self.frame.height))
    
        for i in 0..<values.count {
            currentX += xOffset
            let newPosition = CGPoint(x: currentX,
                                      y: self.frame.height - self.values[i])
            path.addLine(to: newPosition)
        }
        
        layer.fillColor = nil
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 2
        layer.path = path.cgPath
        self.layer.addSublayer(layer)
 
    }
}
