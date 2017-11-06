//
//  RxContainer.swift
//  RxTableCell
//
//  Created by MAXIM KOLESNIK on 06.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit

class RxContainer {
    static var module: UIViewController {
        let viewController = RxTableViewController(style: .plain)
        let presenter = RxPresenter()
        let storage = RxModelStorage()
        
        viewController.storage = storage
        storage.view = viewController
        viewController.presenter = presenter
        presenter.view = viewController
        
        return viewController
    }
}
