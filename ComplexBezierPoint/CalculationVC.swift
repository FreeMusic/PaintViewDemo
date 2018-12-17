//
//  CalculationVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/17.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class CalculationVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let startPoint = CGPoint.init(x: 0, y: 100+NavigationBarHeight*2)
        let endPoint = CGPoint.init(x: kScreenWidth, y: 50+NavigationBarHeight*2)
        
        // 绿色三次贝塞尔曲线
        let path = UIBezierPath.init()
        path.move(to: startPoint)
        //三次贝塞尔曲线
        path.addCurve(to: endPoint, controlPoint1: CGPoint.init(x: 100, y: NavigationBarHeight), controlPoint2: CGPoint.init(x: 240, y: 180+NavigationBarHeight))
        
        let layer = CAShapeLayer.init()
        layer.lineWidth = 1
        layer.strokeColor = UIColor.green.cgColor
        layer.fillColor = nil
        layer.path = path.cgPath
        
        
        //动画1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        layer.add(animation, forKey: "")
        
        self.view.layer.addSublayer(layer)
    }

}
