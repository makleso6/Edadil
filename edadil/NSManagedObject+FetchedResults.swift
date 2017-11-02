//
//  NSManagedObject+FetchedResults.swift
//  ScoreBook
//
//  Created by MAXIM KOLESNIK on 04.05.17.
//  Copyright © 2017 Sugar and Candy. All rights reserved.
//

import CoreData
import MagicalRecord

public protocol FetchedResults: class {}
extension NSManagedObject: FetchedResults {}
public extension FetchedResults where Self: NSManagedObject {
    
    public static func fetchAll(groupedBy: String? = nil,
                                sortedBy: [String] = [],
                                ascending: Bool = true,
                                delegate: NSFetchedResultsControllerDelegate?,
                                with predicate: NSPredicate? = nil,
                                in context: NSManagedObjectContext = NSManagedObjectContext.mr_default()) -> NSFetchedResultsController<Self>? {
        
        
        let request = requestAll(sortedBy: sortedBy, ascending: ascending, with: predicate, in: context)
        let controller = fetchController(with: request, delegate: delegate, useFileCache: true, groupedBy: groupedBy, in: context)
        try! controller.performFetch()
        return controller
    }
    
    public static func fetchAll(groupedBy: String? = nil,
                                sortedBy: [NSSortDescriptor] = [],
                                ascending: Bool = true,
                                delegate: NSFetchedResultsControllerDelegate,
                                with predicate: NSPredicate? = nil,
                                in context: NSManagedObjectContext = NSManagedObjectContext.mr_default()) -> NSFetchedResultsController<Self>? {
        
        
        let request = requestAll(sortedBy: sortedBy, ascending: ascending, with: predicate, in: context)
        let controller = fetchController(with: request, delegate: delegate, useFileCache: false, groupedBy: groupedBy, in: context)
        try! controller.performFetch()
        return controller
    }
    
    
    public static func requestAll(sortedBy: [String] = [], ascending: Bool = true, with predicate: NSPredicate? = nil, in context: NSManagedObjectContext = NSManagedObjectContext.mr_default()) -> NSFetchRequest<Self> {
        let sortDescriptors: [NSSortDescriptor] = sortedBy.flatMap { string in NSSortDescriptor(key: string, ascending: ascending)}
        let request = self.requestAll(sortedBy: sortDescriptors, ascending: ascending, with: predicate, in: context)
        
        return request
    }
    
    public static func requestAll(sortedBy: [NSSortDescriptor] = [], ascending: Bool = true, with predicate: NSPredicate? = nil, in context: NSManagedObjectContext = NSManagedObjectContext.mr_default()) -> NSFetchRequest<Self> {
        let defaultBatchSize = 20
        let request = FetchRequest<Self>(in: context, batchSize: defaultBatchSize, limit: nil, filtered: predicate, sorted: sortedBy).nsFetchRequest
        
        return request
    }
    
    public static func fetchController(with request: NSFetchRequest<Self>, delegate: NSFetchedResultsControllerDelegate?, useFileCache: Bool = false, groupedBy: String? = nil, in context: NSManagedObjectContext = NSManagedObjectContext.mr_default()) -> NSFetchedResultsController<Self> {
        
        let cacheName = useFileCache ? "cache" : nil
        
        let controller = NSFetchedResultsController<Self>(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: groupedBy, cacheName: cacheName)
        controller.delegate = delegate
        return controller
        
    }
}

public struct FetchRequest<T: NSManagedObject> {
    public init(in context: NSManagedObjectContext, batchSize: Int = 20, limit: Int? = nil, filtered predicate: NSPredicate? = nil, sorted: [NSSortDescriptor] = []) {
        nsFetchRequest = NSFetchRequest<T>(entityName: T.mr_entityName())
        nsFetchRequest.entity = NSEntityDescription.entity(forEntityName: T.mr_entityName(), in: context)
        nsFetchRequest.fetchBatchSize = batchSize
        if let predicate = predicate { nsFetchRequest.predicate = NSPredicate(format: predicate.predicateFormat) }
        nsFetchRequest.sortDescriptors = sorted
        if let limit = limit { nsFetchRequest.fetchLimit = limit }
    }
    
    public var nsFetchRequest: NSFetchRequest<T>
}
