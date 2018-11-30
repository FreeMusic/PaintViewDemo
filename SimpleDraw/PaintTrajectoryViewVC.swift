//
//  PaintTrajectoryViewVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

//画圆弧的UIBezierPath相关方法
//+ (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
//center:圆弧的中心，相对所在视图； radius：圆弧半径； startAngle：起始点的角度(相对角度坐标系0)； endAngle：结束点的角度(相对角度坐标系0)； clockwise：是否为顺时针方向。
//- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
//在原有的线上添加一条弧线 。center:圆弧的中心，相对所在视图； radius：圆弧半径； startAngle：起始点的角度(相对角度坐标系0)； endAngle：结束点的角度(相对角度坐标系0)； clockwise：是否为顺时针方向。

class PaintTrajectoryViewVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //在矩形中画一条圆弧
        paintTrajectory()
        //折线和弧线构成的曲线
        lineAndTrajectoryView()
    }

    /**
     在矩形中画一条圆弧
     */
    func paintTrajectory() {
        let view = UIView.init(frame: CGRect.init(x: (kScreenWidth-200)/2, y: NavigationBarHeight, width: 100, height: 100))
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        
        //线的路径
        let viewCenter = CGPoint.init(x: view.frame.width/2, y: view.frame.height/2)// 画弧的中心点，相对于view
        let path = UIBezierPath.init(arcCenter: viewCenter, radius: 33, startAngle: CGFloat(0), endAngle: CGFloat(1.6*Double.pi), clockwise: true)
        
        let layer = CAShapeLayer.init()
        layer.lineWidth = 1
        layer.strokeColor = UIColor.green.cgColor
        layer.fillColor = nil
        layer.path = path.cgPath
        view.layer.addSublayer(layer)
    }
    
    /**
     折线和弧线构成的曲线
     */
    func lineAndTrajectoryView() {
        let view = UIView.init(frame: CGRect.init(x: (kScreenWidth-200)/2, y: NavigationBarHeight+200, width: 150, height: 150))
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        
        //线的路径
        let viewCenter = CGPoint.init(x: view.frame.width/2, y: view.frame.height/2)// 画弧的中心点，相对于view
        
        let path = UIBezierPath.init()
        
        path.move(to: CGPoint.init(x: 0, y: 0))
        path.addLine(to: viewCenter)
        
        // 添加一条弧线
        path.addArc(withCenter: viewCenter, radius: 50, startAngle: 0, endAngle: CGFloat(Double.pi), clockwise: true)
        let layer = CAShapeLayer.init()
        layer.lineWidth = 1
        layer.strokeColor = UIColor.green.cgColor
        layer.fillColor = nil
        layer.path = path.cgPath
        view.layer.addSublayer(layer)
    }
}
