//
//  RxTableViewController.swift
//  RxTableCell
//
//  Created by MAXIM KOLESNIK on 06.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit
import DTTableViewManager
import RxCocoa
import RxSwift

class RxTableViewController: UITableViewController {
    
    var presenter: RxPresenter!
    var storage: RxModelStorage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storage.setup()
        presenter.load()

        
    }
    
}
