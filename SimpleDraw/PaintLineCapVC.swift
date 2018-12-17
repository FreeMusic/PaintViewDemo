//
//  PaintLineCapVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/17.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class PaintLineCapVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = PaintLineCapView.init(frame: self.view.bounds)
        self.view.addSubview(view)
    }
    
}
