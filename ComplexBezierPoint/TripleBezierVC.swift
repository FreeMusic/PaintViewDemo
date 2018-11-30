//
//  TripleBezierVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit
/**
 三次贝塞尔曲线  比较于二次贝塞尔曲线 多了一个控制点
 
 - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2
 三次贝赛尔曲线，起点用 moveToPoint方法给出；endPoint:贝赛尔曲线终点；controlPoint1:控制点1；controlPoint2:控制点2；
 曲线是由起点趋向控制点1，之后趋向控制点2，最后到达终点（不会经过控制点）的曲线。在起点和终点所在直线方向上，曲线在起点和控制点1之间，趋向控制点1；在控制点2和终点之间，趋向控制点2.控制点与起点和终点所在直线的偏移影响曲线的偏移程度
 */
class TripleBezierVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view = UIView.init(frame: CGRect.init(x: (kScreenWidth-200)/2, y: NavigationBarHeight, width: 200, height: 200))
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        
        let startPoint = CGPoint.init(x: 0, y: 100)
        let endPoint = CGPoint.init(x: 200, y: 50)
        
        // 绿色二次贝塞尔曲线
        let path = UIBezierPath.init()
        path.move(to: startPoint)
        //三次贝塞尔曲线
        path.addCurve(to: endPoint, controlPoint1: CGPoint.init(x: 10, y: 0), controlPoint2: CGPoint.init(x: 70, y: 180))
        let layer = CAShapeLayer.init()
        layer.lineWidth = 1
        layer.strokeColor = UIColor.green.cgColor
        layer.fillColor = nil
        layer.path = path.cgPath
        view.layer.addSublayer(layer)
    }

}
