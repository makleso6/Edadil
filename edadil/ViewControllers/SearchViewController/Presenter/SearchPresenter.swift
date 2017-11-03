//
//  SearchPresenter.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 27.10.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import Foundation
import Alamofire

@objc public class SearchPresenter: NSObject {
    
   @objc public func load() {
        SessionManager.default.request("https://api.edadev.ru/intern/").responseJSON { (response) in
            if let responseData = response.result.value as? [[AnyHashable: Any]]  {
                Product.saveEntities(onSerialQueue: responseData, deleteUnmatched: true, completionOnMainThread: { (products) in
                    
                   let a =  Product.mr_findAll()
                    //print("a")
                    //print(a)
                    //print("a")
                })
            }
        }
    }
}
