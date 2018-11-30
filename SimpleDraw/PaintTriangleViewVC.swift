//
//  PaintTriangleViewVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//
/**
 三角形
 */
import UIKit

class PaintTriangleViewVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        paintTriangle()
    }
    
    func paintTriangle() {
        
        let path = UIBezierPath.init()
        ////layer起点
        path.move(to: CGPoint.init(x: 30, y: NavigationBarHeight+50))
        ////layer整条路径上经过的其他点  用此方法也可以画多边形
        path.addLine(to: CGPoint.init(x: 30, y: NavigationBarHeight+100))
        path.addLine(to: CGPoint.init(x: 200, y: NavigationBarHeight+100))
//        path.addLine(to: CGPoint.init(x: 200, y: NavigationBarHeight+50))
        path.close()//图层封闭
        let layer = CAShapeLayer.init()
        layer.path = path.cgPath
        layer.lineWidth = 1
        layer.strokeColor = UIColor.orange.cgColor
        layer.fillColor = UIColor.clear.cgColor//填充色
        
        self.view.layer.addSublayer(layer)
    }

}
