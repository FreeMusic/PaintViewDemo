//
//  PaintDottedLineVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/17.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class PaintDottedLineVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shapeLayer = CAShapeLayer()
        let size = self.view.frame.size
        
        let shapeRect = CGRect.init(x: 10, y: 10, width: 200, height: 200)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = red.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineJoin = kCALineJoinRound
        //
        shapeLayer.lineDashPattern = [3,4]
        let path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5)
        shapeLayer.path = path.cgPath
        self.view.layer.addSublayer(shapeLayer)
        
    }
    
    
}
