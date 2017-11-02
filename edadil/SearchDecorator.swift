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
//        tableView.estimatedRowHeight = 100
        tableView.estimatedRowHeight = 85.0
        tableView.rowHeight = UITableViewAutomaticDimension
        manager.startManaging(withDelegate: self)
        manager.register(ProductTableViewCell.self)
//        manager.heightForCell(withItem: Product.self) { (item, index) -> CGFloat in
//            return UITableViewAutomaticDimension
//        }
//        
//        manager.estimatedHeightForCell(withItem: Product.self) { (item, index) -> CGFloat in
//            return 100
//        }
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
