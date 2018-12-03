//
//  LayerAnimationVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/3.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class LayerAnimationVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        animation()
    }
    
    func animation() {
        //MARK: 贝塞尔曲线
        let startPoint = CGPoint(x:20, y:400)
        let endPoint = CGPoint(x:320, y:400)
        let controlPoint = CGPoint(x:170, y:300)

        //曲线1
        let path10 = UIBezierPath()
        let layer10 = CAShapeLayer()
        path10.move(to: startPoint)
        path10.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        layer10.path = path10.cgPath
        layer10.fillColor = UIColor.clear.cgColor
        layer10.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(layer10)
        
        //MARK: 动画
        //动画1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        layer10.add(animation, forKey: "")
    }

}
