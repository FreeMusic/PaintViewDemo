//
//  PieChartView.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class PieChartView: UIView {
    //设置圆点
    var centerPoint:CGPoint!
    var radius:CGFloat!
    
    var startAngle:Float = 0
    var endAngle:Float = 0
    var allValue:Float = 0
    var dataSource = [456, 56, 559]
    var colors = [UIColor.green, UIColor.orange, UIColor.blue]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        radius = frame.size.width*0.4
        centerPoint = CGPoint.init(x: frame.size.width/2, y: frame.size.height/2)
        //画图
        drawPieChartView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
/**
 画图
 */

extension PieChartView {
    func drawPieChartView() {
        
        for index in 0...dataSource.count-1 {
            let value = dataSource[index] 
            allValue = allValue+Float(value)
        }
        
        //for循环画图
        for index in 0...dataSource.count-1 {
            bezierPaint(index: index)
        }
    }
    //贝塞尔和CASherLayer画图
    func bezierPaint(index:Int) {
        
        let targetValue = dataSource[index]
        let ratioString = String(format: "%.5f", Float(targetValue)/Float(allValue))
        
        endAngle = startAngle + (Float(ratioString)!-0.005)*2*Float(Double.pi)
        //bezierPath形成闭合的扇形路径  外弧形
        let bezierOutPath = UIBezierPath.init()
        // 添加一条弧线
        bezierOutPath.addArc(withCenter: centerPoint, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        bezierOutPath.addLine(to: centerPoint)
        bezierOutPath.close()
        //////外弧形渲染
        let outLayer = CAShapeLayer.init()
        outLayer.lineWidth = 1
        outLayer.fillColor = colors[index].cgColor
        outLayer.strokeColor = UIColor.white.cgColor
        outLayer.path = bezierOutPath.cgPath
        self.layer.addSublayer(outLayer)
        
        let start = dataSource[index]
        let scaleString = String(format: "%.5f", Float(start)/Float(allValue))
        startAngle = startAngle+(Float(scaleString)!-1)*2*Float(Double.pi)
        
        ////bezierPath形成闭合的扇形路径 内弧形
        let bezierInsidePath = UIBezierPath.init()
        // 添加一条弧线
        bezierInsidePath.addArc(withCenter: centerPoint, radius: radius*0.8, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        bezierInsidePath.addLine(to: centerPoint)
        bezierInsidePath.close()
        //////内弧形渲染
        let inSideLayer = CAShapeLayer.init()
        inSideLayer.lineWidth = 1
        inSideLayer.fillColor = UIColor.white.cgColor
        inSideLayer.path = bezierInsidePath.cgPath
        self.layer.addSublayer(inSideLayer)
    }
}
