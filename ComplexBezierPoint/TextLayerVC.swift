//
//  TextLayerVC.swift
//  画图Demo
//
//  Created by 橘子 on 2018/12/14.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit
//CATextLayer是CALayer的一个子类，专门用于显示文字。

class TextLayerVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layer = CATextLayer.init()
        layer.frame = CGRect.init(x: 50, y: 200, width: 100, height: 50)
        let text = "CATextLayer"

        layer.string = text
        let font = UIFont.systemFont(ofSize: 15)
        layer.font = font.fontName as CFTypeRef
        layer.fontSize = font.pointSize
        layer.foregroundColor = black.cgColor
        //文本自适应图层大小，默认是NO；用来使文本换行；
        layer.isWrapped = true
//        设置文字的分辨率，默认为1；使用CATextLayer设置文本，可能会产生模糊状态，因为该默认的分辨率不是retina，设置如下代码即可：
        layer.contentsScale = UIScreen.main.scale
        self.view.layer.addSublayer(layer)
        
    }

}
