//
//  ListViewController.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 03.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit
import DTTableViewManager

class ListViewController: UITableViewController {
    var manager = DTTableViewManager()
    var presenter = ListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.load()
        tableView.estimatedRowHeight = 85.0
        tableView.rowHeight = UITableViewAutomaticDimension
        manager.startManaging(withDelegate: self)
        manager.register(ProductTableViewCell.self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.load()

    }
}

extension ListViewController: DTTableViewManageable {}
