//
//  ListPresenter.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 03.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import Foundation
import Alamofire

class ListPresenter {
    
    weak var view: ListViewController!
    
    func load() {
        SessionManager.default.request("https://api.edadev.ru/intern/").responseJSON { (response) in
            if let responseData = response.result.value as? [[AnyHashable: Any]]  {
                Product.saveEntities(onSerialQueue: responseData, deleteUnmatched: true, completionOnMainThread: { (_) in
                    let products = ProductStorage.saveProducts
                    self.view.manager.memoryStorage.setItems(products)
                })
            }
        }
    }
}

