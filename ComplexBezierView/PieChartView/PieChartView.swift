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

    var startAngle = 0
    var endAngle = 0
    var allValue = 0
    var dataSource = [456, 56, 559]
    var colors = [UIColor.green, UIColor.orange, UIColor.blue]
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        radius = frame.size.width*0.6
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
            allValue = allValue+value
        }
        
        //for循环画图
        for index in 0...dataSource.count-1 {
            bezierPaint(index: index)
        }
    }
    //贝塞尔和CASherLayer画图
    func bezierPaint(index:Int) {
        
        let targetValue = dataSource[index]
        endAngle = startAngle + targetValue/allValue*2*Int(Double.pi)
        print(endAngle)
        //bezierPath形成闭合的扇形路径  外弧形
        let bezierOutPath = UIBezierPath.init()
        // 添加一条弧线
        bezierOutPath.addArc(withCenter: centerPoint, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        bezierOutPath.addLine(to: centerPoint)
        bezierOutPath.close()
        //////外弧形渲染
        let outLayer = CAShapeLayer.init()
        outLayer.lineWidth = 1
        outLayer.fillColor = UIColor.green.cgColor
        outLayer.path = bezierOutPath.cgPath
        self.layer.addSublayer(outLayer)
        
        if index > 0 {
            let start = dataSource[index-1]
            
            startAngle = startAngle+start/allValue*2*Int(Double.pi)
        }
        
        print(startAngle)
    }
}
