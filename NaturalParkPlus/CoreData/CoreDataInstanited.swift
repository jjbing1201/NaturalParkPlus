//
//  CoreDataInstanited.swift
//  NaturalParkPlus
//
//  Created by Computer on 15/1/19.
//  Copyright (c) 2015年 Computer. All rights reserved.
//

import UIKit
import CoreData

class CoreDataInstanited: NSObject {
    
    var privateContext: NSManagedObjectContext?
    var managedObjectModel: NSManagedObjectModel?
    var persistentStoreCoordinator: NSPersistentStoreCoordinator?
    
    private var mainContext: NSManagedObjectContext?
    private var masterContext: NSManagedObjectContext?
    
    override init() {
        super.init()
        managedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil)
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!)
        let applicationDocumentsDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).last as NSURL
        let storeURL = applicationDocumentsDirectory.URLByAppendingPathComponent(ZGlobal().LOCAL_SQLITE)
        var options = [NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true]
        var error: NSError?
        persistentStoreCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options, error: &error)
        
        masterContext = setupContextWithConcurrencyType(NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        masterContext?.persistentStoreCoordinator = persistentStoreCoordinator
        
        mainContext = setupContextWithConcurrencyType(NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        mainContext?.parentContext = masterContext
        
        privateContext = setupContextWithConcurrencyType(NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        privateContext?.parentContext = mainContext
    }
    
    func setupContextWithConcurrencyType(type: NSManagedObjectContextConcurrencyType) -> NSManagedObjectContext  {
        var context = NSManagedObjectContext(concurrencyType: type)
        return context;
    }
    
    func createManagedObject(entityName: String) -> NSManagedObject {
        var mmo = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: privateContext!) as NSManagedObject
        return mmo
    }
    
    func save() {
        privateContext?.performBlock({ () -> Void in
            self.privateContext?.save(nil)
            self.mainContext?.performBlock({ () -> Void in
                self.mainContext?.save(nil)
                self.masterContext?.performBlock({ () -> Void in
                    self.masterContext?.save(nil)
                    println("CoreDataStore save completed")
                })
            })
        })
    }
}

// MARK: - 唯一单例出口
class CoreDataInstanited_Enterance: CoreDataInstanited {
    class var shared: CoreDataInstanited_Enterance {
        dispatch_once(&Inner.token) {
            Inner.instance = CoreDataInstanited_Enterance()
        }
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: CoreDataInstanited_Enterance?
        static var token: dispatch_once_t = 0
    }
}








