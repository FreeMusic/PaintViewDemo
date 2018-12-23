//
//  IrregularGradientVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/13.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class IrregularGradientVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //绘制UIBezierPath路径
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 0, y: NavigationBarHeight))
        path.addLine(to: CGPoint.init(x: 0, y: 150+NavigationBarHeight))
        path.addCurve(to: CGPoint.init(x: kScreenWidth, y: 150+NavigationBarHeight), controlPoint1: CGPoint.init(x: kScreenWidth*0.3, y: 200+NavigationBarHeight), controlPoint2: CGPoint.init(x: kScreenWidth*0.8, y: 350+NavigationBarHeight))
        path.addLine(to: CGPoint.init(x: kScreenWidth, y: NavigationBarHeight))
        
        //绘制渐变 图片
        let img = drawLinearGradient(startColor: UIColor.green.cgColor, endColor: UIColor.red.cgColor)

        let layer = CAShapeLayer.init()
        //本质上生成一张渐变色图片 作为layer的填充背景
        layer.fillColor = UIColor.init(patternImage: img).cgColor
        layer.path = path.cgPath
        self.view.layer.addSublayer(layer)
    }

    /**
     绘制渐变
     */
    func drawLinearGradient(startColor:CGColor, endColor:CGColor) -> UIImage {
        
        //创建CGContextRef
        UIGraphicsBeginImageContext(self.view.bounds.size)
        let context = UIGraphicsGetCurrentContext()
        
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 0, y: NavigationBarHeight))
        path.addLine(to: CGPoint.init(x: 0, y: kScreenHeight))
        path.addLine(to: CGPoint.init(x: kScreenWidth, y: kScreenHeight))
        path.addLine(to: CGPoint.init(x: kScreenWidth, y: 0))
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations = [CGFloat(0.0), CGFloat(1.0)]
        let colors = [startColor, endColor]
        let gradient = CGGradient.init(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
        
        let pathRect: CGRect = path.cgPath.boundingBox
        //具体方向可根据需求修改
        let startPoint = CGPoint.init(x: pathRect.minX, y: pathRect.midY)
        let endPoint = CGPoint.init(x: pathRect.maxX, y: pathRect.midY)
        
        context?.saveGState()
        context?.addPath(path.cgPath)
        context?.clip()
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        context?.restoreGState()
        //获取绘制的图片
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img!
    }

}
