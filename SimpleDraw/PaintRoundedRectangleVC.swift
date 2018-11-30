//
//  PaintRoundedRectangleVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

//画单角的圆角矩形的UIBezierPath相关方法
//+ (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
//为矩形的某一个角添加自定义大小的圆角（当自定义的圆角大小超过矩形宽或高的一半是，自动取矩形宽或高的一半作为圆角大小)

class PaintRoundedRectangleVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //四角切圆角
        drawQuadRangle()
        //单角切圆角
        drawUnicornous()
    }
    /**
     四角切圆角
     */
    func drawQuadRangle() {
        // 需要画圆角矩形
        let view = UIView.init(frame: CGRect.init(x: (kScreenWidth-200)/2, y: NavigationBarHeight, width: 100, height: 100))
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        
        //线的路径
        let path = UIBezierPath.init(roundedRect: view.bounds, cornerRadius: 20)
        let layer = CAShapeLayer.init()
        layer.lineWidth = 1
        layer.strokeColor = UIColor.green.cgColor
        layer.path = path.cgPath
        view.layer.mask = layer
    }
    /**
     单角切圆角 （多个角进行圆角切）
     */
    func drawUnicornous() {
        // 需要画圆角矩形
        let view = UIView.init(frame: CGRect.init(x: (kScreenWidth-200)/2, y: NavigationBarHeight+150, width: 100, height: 100))
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        
        //线的路径
        
        //此方法可以用来对多个角进行圆角切
//        let path = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: UIRectCorner(rawValue: UIRectCorner.RawValue(UInt8(UIRectCorner.topLeft.rawValue) | UInt8(UIRectCorner.bottomRight.rawValue))) , cornerRadii: CGSize.init(width: 20, height: 0))
        //此方法可以用来对单个角进行圆角切
        let path = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: UIRectCorner.topLeft, cornerRadii: CGSize.init(width: 20, height: 0))
        
        let layer = CAShapeLayer.init()
        layer.lineWidth = 1
        layer.strokeColor = UIColor.green.cgColor
        layer.path = path.cgPath
        view.layer.mask = layer
    }
}
