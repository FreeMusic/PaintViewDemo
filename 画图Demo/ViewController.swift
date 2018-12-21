//
//  ViewController.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

//结合UIBezierPath 与 CAShapeLayer 画图
//
//将UIBezierPath 对象 转化为CGPathRef 对象， 赋值给CAShapeLayer的path属性即可，即可画出各种线条和图形
//layer.path = path.cgPath
/**
 *  title 跳转的控制器的标题
 *  `class` 跳转的控制器
 */
struct PaintInfoMessage {
    let title:String
    let `class` : AnyClass
}

class ViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView:UITableView?
    
    var PaintMessages = [
        PaintInfoMessage.init(title: "画直线", class: PaintLineViewVC.self),
        PaintInfoMessage.init(title: "画阴影图", class: PaintShadowView.self),
        PaintInfoMessage.init(title: "画三角形", class: PaintTriangleViewVC.self),
        PaintInfoMessage.init(title: "画圆形或椭圆", class: PaintCilcleViewVC.self),
        PaintInfoMessage.init(title: "画圆角矩形", class: PaintRoundedRectangleVC.self),
        PaintInfoMessage.init(title: "画弧线", class: PaintTrajectoryViewVC.self),
        PaintInfoMessage.init(title: "LineCap形状", class: PaintLineCapVC.self),
        PaintInfoMessage.init(title: "二次贝塞尔曲线", class: QuadRaticBezierVC.self),
        PaintInfoMessage.init(title: "三次贝塞尔曲线", class: TripleBezierVC.self),
        PaintInfoMessage.init(title: "绘制饼状图", class: PieChartVC.self),
        PaintInfoMessage.init(title: "Layer动画", class: LayerAnimationVC.self),
        PaintInfoMessage.init(title: "不规则渐变色图形", class: IrregularGradientVC.self),
        PaintInfoMessage.init(title: "CATextLayer", class: TextLayerVC.self),
        PaintInfoMessage.init(title: "贝塞尔曲线计算", class: CalculationVC.self),
        PaintInfoMessage.init(title: "绘制虚线", class: PaintDottedLineVC.self),
        PaintInfoMessage.init(title: "绘制柱状图动画", class: HistogramVC.self)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "画图Demo"
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: NavigationBarHeight, width: kScreenWidth, height: kScreenHeight-NavigationBarHeight), style: UITableViewStyle.plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view.addSubview(tableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        let infoMessage = self.PaintMessages[indexPath.row]
        cell?.textLabel?.text = infoMessage.title
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PaintMessages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoMessage = self.PaintMessages[indexPath.row]
        let vcClass = infoMessage.class as? UIViewController.Type
        let vc = vcClass!.init()
        vc.title = infoMessage.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

