//
//  PaintLineCapView.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/17.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class PaintLineCapView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = white
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 50, y: 100))
        path.addLine(to: CGPoint.init(x: 250, y: 100))
        path.addLine(to: CGPoint.init(x: 100, y: 300))
        path.lineWidth = 40
        path.lineJoinStyle = .bevel
        path.lineCapStyle = .round
        path.stroke()

        let layer = CAShapeLayer.init()
        layer.lineWidth = 40
        layer.strokeColor = black.cgColor
        layer.fillColor = clear.cgColor
        layer.path = path.cgPath
        self.layer.addSublayer(layer)
    }
}
