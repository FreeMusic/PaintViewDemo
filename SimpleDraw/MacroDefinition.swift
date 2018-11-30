//
//  MacroDefinition.swift
//  画图Demo
//
//  Created by 橘子 on 2018/11/30.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width//屏幕宽
let kScreenHeight = UIScreen.main.bounds.size.height//屏幕高

//电池栏
var kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
//导航栏
var kNavBarHeight:CGFloat! = 44
//tabbar高度
var kTabBarHeight:CGFloat! = (kStatusBarHeight > 20) ? 83.0 : 49.0
//导航+电池栏
var NavigationBarHeight:CGFloat! = kStatusBarHeight+kNavBarHeight
//安全区底部高度
var KSafeBarHeight:CGFloat! = (kStatusBarHeight > 20) ? 34.0 : 0
