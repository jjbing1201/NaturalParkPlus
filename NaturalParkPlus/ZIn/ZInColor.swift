//
//  ZInColor.swift
//  NaturalParkPlus
//
//  Created by Computer on 15/1/19.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit
import Foundation

class ZInColor: NSObject {
    
    private(set) var ZIn_WhiteColor_Cover: UIColor = UIColor()
    private(set) var ZIn_RedColor_Cover: UIColor = UIColor()
    
    override private init() {
        super.init()
        
        // read plist
        let plist = NSBundle.mainBundle().pathForResource("AppColor", ofType: "plist")
        let data = NSDictionary(contentsOfFile: plist!) as Dictionary<String, AnyObject>
        println("/* ------ 读取全局颜色配置表 ------- */")
        for (key, val) in data {
            let rgba = val as [Int]
            if rgba.count != 4 {
                continue
            }
            let r: CGFloat = CGFloat(Float(rgba[0]) / 255.0)
            let g: CGFloat = CGFloat(Float(rgba[1]) / 255.0)
            let b: CGFloat = CGFloat(Float(rgba[2]) / 255.0)
            let a: CGFloat = CGFloat(Float(rgba[3]) / 100.0)
            let color = UIColor(red: r, green: g, blue: b, alpha: a)
            self.setValue(color, forKey: key)
            println("\(key):\(color)")
        }
        println("/* ------ END ------- */")
    }
}

// MARK: - 颜色出口
class ZInColor_Enterance: ZInColor {
    class var shared: ZInColor_Enterance {
        dispatch_once(&Inner.token) {
            Inner.instance = ZInColor_Enterance()
        }
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: ZInColor_Enterance?
        static var token: dispatch_once_t = 0
    }
}


