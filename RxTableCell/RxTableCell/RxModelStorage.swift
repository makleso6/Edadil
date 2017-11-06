//
//  RxModelStorage.swift
//  RxTableCell
//
//  Created by MAXIM KOLESNIK on 06.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import Foundation
import DTTableViewManager

class RxModelStorage {
    weak var view: RxTableViewController!
    var manager: DTTableViewManager = DTTableViewManager()
    
    func setup() {
        manager.startManaging(withDelegate: self)
        manager.register(RxTableViewCell.self)
    }
}


extension RxModelStorage: DTTableViewManageable {
    var tableView : UITableView! {
        return view.tableView
    }

}
