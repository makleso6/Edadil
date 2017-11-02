//
//  NSManagedObject+Import.swift
//  ScoreBook
//
//  Created by MAXIM KOLESNIK on 20.04.17.
//  Copyright © 2017 Proscom. All rights reserved.
//

import Foundation
import CoreData
import MagicalRecord

public protocol Importable {}

public extension NSManagedObject {
    fileprivate static let baseQueuePath = "ru.savingQueue."
    fileprivate static var queues: [DispatchQueue]? = []
    
    public static func queue(for entityType: AnyClass) -> DispatchQueue {
        let entityTypeNSStringValue = NSStringFromClass(entityType)
        let fullPathQueue = baseQueuePath + entityTypeNSStringValue
        var currentQueue: DispatchQueue?
        for temp: DispatchQueue in queues! {
            let tempQueueName = temp.label
            if tempQueueName == fullPathQueue {
                currentQueue = temp
                break
            }
        }
        if currentQueue == nil {
            currentQueue = DispatchQueue(label: fullPathQueue)
        }
        return currentQueue!
    }
}
extension NSManagedObject: Importable { }

public extension Importable where Self: NSManagedObject {
    
    public static func saveEntities(onSerialQueue entities: [[AnyHashable: Any]],
                                    deleteUnmatched: Bool,
                                    completionOnMainThread : @escaping (_ mainThreadEntities: [Self]) -> Void) {
        saveEntities(entities, deleteUnmatched: deleteUnmatched, in: queue(for: self), completionOnMainThread: completionOnMainThread)
    }
    
    public static func saveEntities(_ entities: [[AnyHashable: Any]],
                                    deleteUnmatched: Bool,
                                    in queue: DispatchQueue,
                                    completionOnMainThread completion: @escaping (_ mainThreadEntities: [Self]) -> Void) {
        //print(queue.label)
        var parsedEntities = [Any]()
        save(in: queue, savingBlock: { (context: NSManagedObjectContext) in
            parsedEntities = self.parseDictionaries(entities, deleteUnmatched: deleteUnmatched, in: context)
        }, completionOnMainThread: {
            let predicate = NSPredicate(format: "self in %@", parsedEntities)
            if let mainThreadEntities = Self.mr_findAll(with: predicate) as? [Self]{
                completion(mainThreadEntities)
            }
            
        })
    }
    
    public static func save(in queue: DispatchQueue,
                            savingBlock block: @escaping (_ localContext: NSManagedObjectContext) -> Void,
                            completionOnMainThread completion: @escaping () -> Void )  {
        queue.async {
            let localContext = NSManagedObjectContext.mr_context(withParent: NSManagedObjectContext.mr_rootSaving())
            block(localContext)
            localContext.mr_saveToPersistentStoreAndWait()
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    public static func parseDictionaries(_ dictionaries: [[AnyHashable: Any]], deleteUnmatched: Bool, in context: NSManagedObjectContext) -> [Self] {
        var importedObjects: [Self] = []
        for dictionary: [AnyHashable: Any] in dictionaries {
            let object = Self.mr_import(from: dictionary, in: context)
                importedObjects.append(object)
            
        }
        if !deleteUnmatched {
            return importedObjects
        }
        if let allObjects = self.mr_findAll(in: context) as? [Self]{
            var objectsToDelete = Set(allObjects)
            let importedObjectsSet = Set(importedObjects)
            objectsToDelete.subtract(importedObjectsSet)
            for objectToDelete: NSManagedObject in objectsToDelete {
                objectToDelete.mr_deleteEntity(in: context)
            }

        }
        return importedObjects
    }
    
    
}
