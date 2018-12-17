//
//  PaintLineViewVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//
/**
 画直线
 
 + (instancetype)bezierPath
 生成一个UIBezierPath对象, 多用于画 不规则曲线 或 多边图形
 　　
 - (void)moveToPoint:(CGPoint)point
 添加路径起点
 　　
 - (void)addLineToPoint:(CGPoint)point
 添加路径起点外的其他点
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
        //MARK: 动画
        
        // 起点
        linePath.move(to: CGPoint.init(x: 20, y: 300))
        // 其他点
        linePath.addLine(to: CGPoint.init(x: 200, y: 200))
        //可以添加n多个点 可为折线，直线等
//        linePath.addLine(to: CGPoint.init(x: 90, y: 70))
        
        let lineLayer = CAShapeLayer.init()
        
        lineLayer.lineWidth = 1
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = linePath.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        //动画1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        lineLayer.add(animation, forKey: "")
        self.view.layer.addSublayer(lineLayer)
    }
}
