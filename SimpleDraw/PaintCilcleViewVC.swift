//
//  PaintCilcleViewVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

//画椭圆或圆的UIBezierPath相关方法
//+ (instancetype)bezierPathWithOvalInRect:(CGRect)rect：
//生成一个矩形的内切椭圆UIBezierPath对象，如果矩形是正方形，就为内切圆
//在矩形中画内切椭圆

class PaintCilcleViewVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ////画圆形或椭圆
        drawCircleView()
        //画圆形或椭圆  2
        drawCircleViewSecond()
    }
    /**
     画圆形或椭圆  1
     */
    func drawCircleView() {
        // 需要圆视图 若视图为长方形 则绘制椭圆 正方形，则为圆形
        let circleView = UIView.init(frame: CGRect.init(x: (kScreenWidth-200)/2, y: NavigationBarHeight*2, width: 200, height: 100))
        circleView.backgroundColor = UIColor.orange
        self.view.addSubview(circleView)
        
        // 线的路径
        let path = UIBezierPath.init(ovalIn:circleView.bounds)
        let pathLayer = CAShapeLayer.init()
        pathLayer.lineWidth = 1
        pathLayer.strokeColor = UIColor.green.cgColor
        pathLayer.path = path.cgPath
        pathLayer.fillColor = nil
        circleView.layer.addSublayer(pathLayer)
        circleView.layer.mask = pathLayer // layer 的 mask属性，添加蒙版
    }
    /**
     画圆形
     */
    func drawCircleViewSecond() {
        let path = UIBezierPath.init()
        path.addArc(withCenter: CGPoint.init(x: kScreenWidth/2, y: 500), radius: 30, startAngle: 0, endAngle: 2*CGFloat(Double.pi), clockwise: true)
        
        let layer = CAShapeLayer.init()
        layer.lineWidth = 1
        layer.strokeColor = UIColor.green.cgColor
        layer.path = path.cgPath
        layer.fillColor = nil
        self.view.layer.addSublayer(layer)
    }
}
