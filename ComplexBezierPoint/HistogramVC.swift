//
//  HistogramVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/19.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class HistogramVC: BaseViewController {
    
    let color = UIColor.green
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //实心柱形图
        solidBarChart()
        //边框柱形图
        aborderBarChart()
        //边框柱形图的动画
        aborderBarChartAnimation()
    }
}

extension HistogramVC {
    /**
     实心柱形图
     */
    func solidBarChart() {
        let path = UIBezierPath.init()
        let layer = CAShapeLayer.init()
        path.move(to: CGPoint.init(x: kScreenWidth/6, y: kScreenHeight/2))
        path.addLine(to: CGPoint.init(x: kScreenWidth/6, y: kScreenHeight/3))//
        layer.strokeColor = self.color.cgColor
        layer.lineWidth = 30
        layer.path = path.cgPath
        //动画1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        layer.add(animation, forKey: "")
        self.view.layer.addSublayer(layer)
    }
    /**
     边框柱形图 没有动画
     */
    func aborderBarChart() {
        let path = UIBezierPath.init()
        let layer = CAShapeLayer.init()
        path.move(to: CGPoint.init(x: kScreenWidth/3, y: kScreenHeight/2))
        path.addLine(to: CGPoint.init(x: kScreenWidth/3, y: kScreenHeight/3))//
        path.addLine(to: CGPoint.init(x: kScreenWidth/3+30, y: kScreenHeight/3))
        path.addLine(to: CGPoint.init(x: kScreenWidth/3+30, y: kScreenHeight/2))
        layer.strokeColor = self.color.cgColor
        layer.fillColor = self.color.withAlphaComponent(0.1).cgColor
        layer.lineWidth = 1
        layer.path = path.cgPath
        
        self.view.layer.addSublayer(layer)
    }
    /**
     边框柱形图的动画
     */
    func aborderBarChartAnimation() {
        self.drawAborderBarChartAnimation(star: CGPoint.init(x: kScreenWidth/2, y: kScreenHeight/2),
                                          end: CGPoint.init(x: kScreenWidth/2, y: kScreenHeight/3),
                                          duration: 1,
                                          lineWidth: 30,
                                          borderWidth: 1,
                                          mainColor: UIColor(hex: 0xe84855),
                                          borderColor: UIColor(hex: 0xfadadd))
    }
}

extension HistogramVC {
    
    func drawAborderBarChartAnimation(star:CGPoint, end:CGPoint, duration:CGFloat, lineWidth:CGFloat, borderWidth:CGFloat, mainColor:UIColor, borderColor:UIColor) {
        let path = UIBezierPath.init()
        let layer = CAShapeLayer.init()
        path.move(to: star)
        path.addLine(to: end)//
        layer.strokeColor = mainColor.cgColor
        layer.lineWidth = lineWidth
        layer.path = path.cgPath
        //动画1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = CFTimeInterval(duration)
        layer.add(animation, forKey: "")
        
        let inSidePath = UIBezierPath.init()
        let inSideLayer = CAShapeLayer.init()
        let yPoint = end.y+borderWidth
        let newEnd = CGPoint.init(x: end.x, y: yPoint)
        
        inSidePath.move(to: star)
        inSidePath.addLine(to: newEnd)//
        inSideLayer.strokeColor = borderColor.cgColor
        inSideLayer.lineWidth = (lineWidth-borderWidth*2)
        inSideLayer.path = inSidePath.cgPath
        inSideLayer.add(animation, forKey: "")
        
        self.view.layer.addSublayer(layer)
        self.view.layer.addSublayer(inSideLayer)
    }
}
