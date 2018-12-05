//
//  PieChartVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class PieChartVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let pieView = RYQPieChartView.init(frame: CGRect.init(x: 0, y: 0, width: 0.8*kScreenWidth, height: 0.8*kScreenWidth))
        pieView.center = self.view.center
        pieView.backgroundColor = UIColor.white
        self.view.addSubview(pieView)
    }

}
