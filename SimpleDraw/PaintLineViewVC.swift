//
//  PaintLineViewVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//
/**
 画直线
 */
import UIKit

class PaintLineViewVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawLine()
    }
    
    func drawLine() {
         // 线的路径
        let linePath = UIBezierPath.init()
        // 起点
        linePath.move(to: CGPoint.init(x: 20, y: 300))
        // 其他点
        linePath.addLine(to: CGPoint.init(x: 200, y: 200))
        linePath.addLine(to: CGPoint.init(x: 90, y: 70))
        
        let lineLayer = CAShapeLayer.init()
        
        lineLayer.lineWidth = 1
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = linePath.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        
        self.view.layer.addSublayer(lineLayer)
    }
}