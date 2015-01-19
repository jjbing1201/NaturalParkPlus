//
//  ExtensionUIColor.swift
//  NaturalParkPlus
//
//  Created by Computer on 15/1/19.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit
import Foundation

extension UIColor {
    
    // recover name of color
    class func defaultWhiteColor() -> UIColor {
        return UIColor.whiteColor()
    }
    
    // cover color 
    class func coverWhiteColor() -> UIColor {
        return ZInColor_Enterance.shared.ZIn_WhiteColor_Cover
    }
    
    class func coverRedColor() -> UIColor {
        return ZInColor_Enterance.shared.ZIn_RedColor_Cover
    }
}