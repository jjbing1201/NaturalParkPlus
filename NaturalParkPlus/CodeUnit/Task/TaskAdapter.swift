//
//  TaskVariables.swift
//  NaturalParkPlus
//
//  Created by Computer on 15/1/19.
//  Copyright (c) 2015年 Computer. All rights reserved.
//

import UIKit
import Foundation

protocol TaskAdapter {
   
    var taskID: String? {get set}
    
    func execute(callback:taskCallback)
    
}
