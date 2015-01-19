//
//  ZInStyle.swift
//  NaturalParkPlus
//
//  Created by Computer on 15/1/19.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit
import Foundation

class ZInStyle {
    
    init() {
        
        // default windows color is nil
        
        LoadGlobalScheme()

        // set status bar sytle for global using
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.coverWhiteColor()]
        UINavigationBar.appearance().tintColor = UIColor.defaultWhiteColor()
        UINavigationBar.appearance().barTintColor = UIColor.coverRedColor()
        
//        UITabBar.appearance().backgroundColor = UIColor.appDarkGrey()
//        UITabBar.appearance().backgroundImage = UIImage(named: "trans")
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.textTabBar()], forState: UIControlState.Normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor()], forState: UIControlState.Selected)
    }
    
    init(window: UIWindow?) {
        
        // default windows color is nil
        window?.backgroundColor = UIColor.whiteColor()
        
        LoadGlobalScheme()
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.coverWhiteColor()]
        UINavigationBar.appearance().tintColor = UIColor.defaultWhiteColor()
        UINavigationBar.appearance().barTintColor = UIColor.coverRedColor()
//        UINavigationBar.appearance().translucent = false
        
//        UITabBar.appearance().backgroundColor = UIColor.appDarkGrey()
//        UITabBar.appearance().backgroundImage = UIImage(named: "trans")
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.textTabBar()], forState: UIControlState.Normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor()], forState: UIControlState.Selected)
    }
    
    func LoadGlobalScheme() -> Void {
        // load default color scheme// default windows color is nil
        ZInColor_Enterance.shared
        // load Global Config variables
        ZInConfig_Enterance.shared
    }
}
