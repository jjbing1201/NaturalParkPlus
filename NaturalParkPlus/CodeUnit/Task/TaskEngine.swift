//
//  TaskVariables.swift
//  NaturalParkPlus
//
//  Created by Computer on 15/1/19.
//  Copyright (c) 2015年 Computer. All rights reserved.
//

import UIKit
import Foundation

class TaskEngine: NSObject {
   
    private var taskQueue = Array<TaskAdapter>()
    
    private var taskMap: [String : TaskAdapter] = [:]
    
    private var tag: Bool = false
    
    override private init() {
        super.init()
        loop()
    }
    
    func loop() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let sleepTime: useconds_t = 200000 //200毫秒
            while self.tag {
                if self.taskQueue.isEmpty {
                    usleep(sleepTime)
                    continue
                }
                let task = self.taskQueue.removeLast()
                var callback: taskCallback = {(result: TaskResult) -> () in
                    switch result {
                    case .Finished:
                        println("\(task) completion")
                        if task.taskID != nil {
                            self.taskMap.removeValueForKey(task.taskID!)
                        }
                        break
                    case .RetryForSeveralTimes:
                        self.taskQueue.append(task)
                        break
                    default:
                        break
                    }
                }
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                    task.execute(callback)
                })
            }
        })
    }
    
    func start() {
        tag = true
    }
    
    func stop() {
        tag = false
    }
    
    func pushTask(task: TaskAdapter) {
        if task.taskID != nil {
            taskMap.updateValue(task, forKey: task.taskID!)
        }
        println("当前队列数\(taskQueue.count)")
        taskQueue.append(task)
        println("add task:\(task) 当前队列数\(taskQueue.count)")
    }
    
    func findTask(taskID: String) -> TaskAdapter? {
        return taskMap[taskID]
    }
}

// MARK: - task引擎唯一出口
class TaskEngine_Enterance: TaskEngine {
    class var shared: TaskEngine_Enterance {
        dispatch_once(&Inner.token) {
            Inner.instance = TaskEngine_Enterance()
        }
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: TaskEngine_Enterance?
        static var token: dispatch_once_t = 0
    }
}










