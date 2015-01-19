//
//  TaskVariables.swift
//  NaturalParkPlus
//
//  Created by Computer on 15/1/19.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit
import Foundation

enum TaskResult {
    case Finished
    case AlwaysRetry
    case RetryForSeveralTimes
}

typealias taskCallback = (result: TaskResult) -> ()