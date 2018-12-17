//
//  QuadRaticBezierVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

//二次贝赛尔曲线相关方法
//- (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
//贝塞尔二次曲线，起点用 moveToPoint方法给出；endPoint:贝赛尔曲线终点；controlPoint:控制点；曲线是由起点趋向控制点最后到达终点（不会经过控制点）的曲线。控制点决定曲线的起始方向，起点和终点的距离决定曲线趋向控制点的程度。
//设置相同起点，相同控制点，终点不同时贝赛尔曲线比较（即，起点终点距离不同）

class QuadRaticBezierVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quadRaticBezierView()
        
        sameEndPointQuadRaticBezierView()
    }
    /**
     总结：起点和终点的距离越小，趋向控制点结束越早，趋向终点开始越早，曲线弧度越大。
     
     起点终点相同，控制点不同
     */
    func quadRaticBezierView() {
        
        let view = UIView.init(frame: CGRect.init(x: (kScreenWidth-200)/2, y: NavigationBarHeight, width: 200, height: 200))
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)

        // 绿色二次贝塞尔曲线
        let greenPath = UIBezierPath.init()
        greenPath.move(to: CGPoint.init(x: 0, y: 100))
        let end1Point = CGPoint.init(x: 200, y: 50)
        //二次贝塞尔曲线
        greenPath.addQuadCurve(to: end1Point, controlPoint: CGPoint.init(x: 100, y: 200))
        let layer1 = CAShapeLayer.init()
        layer1.lineWidth = 1
        layer1.strokeColor = UIColor.green.cgColor
        layer1.fillColor = nil
        layer1.path = greenPath.cgPath
        view.layer.addSublayer(layer1)
        
        // 红色二次贝塞尔曲线
        let redPath = UIBezierPath.init()
        redPath.move(to: CGPoint.init(x: 0, y: 100))
        let end2Point = CGPoint.init(x: 100, y: 50)
        // 二次贝塞尔曲线
        redPath.addQuadCurve(to: end2Point, controlPoint: CGPoint.init(x: 100, y: 200))
        let layer2 = CAShapeLayer.init()
        layer2.lineWidth = 1
        layer2.strokeColor = UIColor.red.cgColor
        layer2.fillColor = nil
        layer2.path = redPath.cgPath
        view.layer.addSublayer(layer2)
    }
    /**
     总结：控制点与起点和终点所在直线偏移距离越大，曲线弧度越大。
     */
    func sameEndPointQuadRaticBezierView() {
        let view = UIView.init(frame: CGRect.init(x: (kScreenWidth-200)/2, y: NavigationBarHeight+300, width: 200, height: 200))
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        
        let startPoint = CGPoint.init(x: 0, y: 100)
        let endPoint = CGPoint.init(x: 200, y: 50)
        
        // 绿色二次贝塞尔曲线
        let greenPath = UIBezierPath.init()
        greenPath.move(to: startPoint)
        //二次贝塞尔曲线
        greenPath.addQuadCurve(to: endPoint, controlPoint: CGPoint.init(x: 100, y: 200))
        let layer1 = CAShapeLayer.init()
        layer1.lineWidth = 1
        layer1.strokeColor = UIColor.green.cgColor
        layer1.fillColor = nil
        layer1.path = greenPath.cgPath
        view.layer.addSublayer(layer1)
        
        // 红色二次贝塞尔曲线
        let redPath = UIBezierPath.init()
        redPath.move(to: CGPoint.init(x: 0, y: 100))
        // 二次贝塞尔曲线
        redPath.addQuadCurve(to: endPoint, controlPoint: CGPoint.init(x: 100, y: 150))
        let layer2 = CAShapeLayer.init()
        layer2.lineWidth = 1
        layer2.strokeColor = UIColor.red.cgColor
        layer2.fillColor = nil
        layer2.path = redPath.cgPath
        view.layer.addSublayer(layer2)
    }
}
