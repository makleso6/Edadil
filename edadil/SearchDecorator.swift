//
//  SearchDecorator.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 27.10.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit
import DTTableViewManager

@objc public protocol SearchDecoratorable {
    
    var tableView: UITableView! { get }
}


@objc public class SearchDecorator: NSObject {
    
    @objc public weak var objectToDecorate: SearchDecoratorable!
    var manager = DTTableViewManager()
    
    @objc public func decorate() {
        
        manager.startManaging(withDelegate: self)
        manager.register(ProductTableViewCell.self)
    }
    
    @objc public func set(data: [Product]) {
        manager.memoryStorage.setItems(data)
    }

}

extension SearchDecorator: DTTableViewManageable {
    
    public var tableView : UITableView! {
        return objectToDecorate.tableView
    }
    
}
