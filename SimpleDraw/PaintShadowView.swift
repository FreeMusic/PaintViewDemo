//
//  PaintShadowView.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/3.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class PaintShadowView: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        drawLine()
    }
    func drawLine() {
        // 线的路径
        let linePath = UIBezierPath.init()
        //MARK: 动画
        
        // 起点
        linePath.move(to: CGPoint.init(x: 20, y: 400))
        // 其他点
        linePath.addLine(to: CGPoint.init(x: 20, y: 300))
        linePath.addLine(to: CGPoint.init(x: 30, y: 200))
        linePath.addLine(to: CGPoint.init(x: 50, y: 267))
        linePath.addLine(to: CGPoint.init(x: 100, y: 267))
        linePath.addLine(to: CGPoint.init(x: 150, y: 200))
        linePath.addLine(to: CGPoint.init(x: 200, y: 188))
        linePath.addLine(to: CGPoint.init(x: 200, y: 400))
        
        let lineLayer = CAShapeLayer.init()
        
        lineLayer.lineWidth = 1
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = linePath.cgPath
        lineLayer.fillColor = UIColor.orange.withAlphaComponent(0.3).cgColor
        //动画1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        lineLayer.add(animation, forKey: "")
        self.view.layer.addSublayer(lineLayer)
    }
}
