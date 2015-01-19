//
//  ZGlobal.swift
//  NaturalParkPlus
//
//  Created by Computer on 15/1/19.
//  Copyright (c) 2015年 Computer. All rights reserved.
//


import UIKit

struct ZGlobal {
    
    // 本地声明：
    let LOCAL_SQLITE = "NaturalParkPlusDB.sqlite"
    
}

//MARK: - 全局错误代码
enum MaskIdentifier:Int32 {
    
    // 系统级别
    case OnceSwitchClose = 1    // 全局一次性定义开关 <关闭>
    
    // 本地化级别
    
    // 函数级别
    
    // 内存控制
    case None = 0xffffffff
}


