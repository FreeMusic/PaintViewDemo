//
//  PieChartView.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

/*饼状图*/
class RYQPieChartView: UIView {
    
    //设置圆点
    var centerPoint:CGPoint!
    var radius:CGFloat!
    var layerWidth = 40*m6Scale//圆环宽度
    
    var startAngle:Float = 0
    var endAngle:Float = 0
    var allValue:Float = 0
    var dataSource = [456, 567, 559]
    var colors = [UIColor.green, UIColor.orange, UIColor.gray]
    var outBezerArrs = [Any]()
    var outLayers = [Any]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        radius = frame.size.height*0.4-layerWidth
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

extension RYQPieChartView {
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
        
        //////外弧形渲染
        let outLayer = CAShapeLayer.init()
        outLayer.lineWidth = layerWidth
        outLayer.fillColor =  clear.cgColor
        outLayer.strokeColor = colors[index].cgColor
        outLayer.path = bezierOutPath.cgPath
        self.layer.addSublayer(outLayer)
        let start = dataSource[index]
        let scaleString = String(format: "%.5f", Float(start)/Float(allValue))
        startAngle = startAngle+(Float(scaleString)!-1)*2*Float(Double.pi)
        //动画1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        outLayer.add(animation, forKey: "")
        outBezerArrs.append(bezierOutPath)
        outLayers.append(outLayer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = ((touches as NSSet).anyObject()! )as!UITouch
        let point = touch.location(in: self)
        
        var start:Float = 0
        var end:Float = 0
        
        for index in 0...outBezerArrs.count-1 {
            let targetValue = dataSource[index]
            let ratioString = String(format: "%.5f", Float(targetValue)/Float(allValue))
            
            end = start + (Float(ratioString)!-0.005)*2*Float(Double.pi)
            let bezierOutPath = outBezerArrs[index] as! UIBezierPath
            let outLayer = outLayers[index] as! CAShapeLayer
            layerWidth = 40*m6Scale
            if bezierOutPath.contains(point) {
                layerWidth = 60*m6Scale
            }
            
            //移除path上的所有点 重新绘制
            bezierOutPath.removeAllPoints()
            // 添加一条弧线
            bezierOutPath.addArc(withCenter: centerPoint, radius: radius, startAngle: CGFloat(start), endAngle: CGFloat(end), clockwise: true)
            //外弧形渲染
            outLayer.path = bezierOutPath.cgPath
            outLayer.lineWidth = layerWidth
            
            let newstart = dataSource[index]
            let scaleString = String(format: "%.5f", Float(newstart)/Float(allValue))
            start = start+(Float(scaleString)!-1)*2*Float(Double.pi)
        }
    }
}
