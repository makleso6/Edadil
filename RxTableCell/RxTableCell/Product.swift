//
//  Product.swift
//  RxTableCell
//
//  Created by MAXIM KOLESNIK on 06.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import Foundation

class Product: NSObject {
    var name: String = "Simple product name"
    init(name: String) {
        super.init()
        self.name = name
    }
}
