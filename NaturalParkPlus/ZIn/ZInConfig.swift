//
//  ZInColor.swift
//  NaturalParkPlus
//
//  Created by Computer on 15/1/19.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit
import Foundation

class ZInConfig: NSObject {
    
    private(set) var LaunchScreenTime: Int = 0
    private(set) var RegisterUserMaxLength: Int = 0
    private(set) var RegisterPassMaxLength: Int = 0
    private(set) var UserNicknameMaxLength: Int = 0
    private(set) var WebPage_ForgetPass: String = ""
    private(set) var WebPage_ServicePrivatePolicy: String = ""
    private(set) var Server_address: String = ""
    private(set) var TabBarMaxCount: Int = 0
    
    
    override private init() {
        super.init()
        
        readFromPlist()
    }
    
    func readFromPlist() -> Void {
        // read plist
        let plist = NSBundle.mainBundle().pathForResource("AppConfig", ofType: "plist")
        let data = NSDictionary(contentsOfFile: plist!) as Dictionary<String, AnyObject>
        println("/* ------ 读取全局基础属性配置表 ------- */")
        for (key, val) in data {
            self.setValue(val, forKey: key)
            println("\(key):\(val)")
        }
        println("/* ------ END ------- */")
    }
}

// MARK: - 颜色出口
class ZInConfig_Enterance: ZInConfig {
    class var shared: ZInConfig_Enterance {
        dispatch_once(&Inner.token) {
            Inner.instance = ZInConfig_Enterance()
        }
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: ZInConfig_Enterance?
        static var token: dispatch_once_t = 0
    }
}


