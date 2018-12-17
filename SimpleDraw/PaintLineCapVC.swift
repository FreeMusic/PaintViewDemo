//
//  PaintLineCapVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/17.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class PaintLineCapVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 50, y: 100))
        path.addLine(to: CGPoint.init(x: 300, y: 200))
        path.lineWidth = 40
        path.lineJoinStyle = .miter
        path.lineCapStyle = .round
        
        let layer = CAShapeLayer.init()
        layer.masksToBounds = true
        layer.cornerRadius = 1
        layer.lineWidth = 40
        layer.strokeColor = black.cgColor
        layer.fillColor = red.cgColor
        layer.path = path.cgPath
        self.view.layer.addSublayer(layer)
    }
    
}
