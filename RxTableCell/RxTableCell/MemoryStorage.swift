//
//  MemoryStorage.swift
//  RxTableCell
//
//  Created by MAXIM KOLESNIK on 06.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import Foundation

class MemoryStorage {
    static let shared = MemoryStorage()
    lazy var items: [Product] = {
        print("items")
        
        let product1 = Product(name: "Product 1")
        let product2 = Product(name: "Product 2")
        let product3 = Product(name: "Product 3")
        let product4 = Product(name: "Product 4")
        let product5 = Product(name: "Product 5")
        let product6 = Product(name: "Product 6")
        
        return  [product1, product2, product3, product4, product5, product6]//.map({RxCellContainer(product:$0)})
    }()
    
//    static var items: [RxCellContainer] {
//        print("items")
//
//        let product1 = Product(name: "Product 1")
//        let product2 = Product(name: "Product 2")
//        let product3 = Product(name: "Product 3")
//        let product4 = Product(name: "Product 4")
//        let product5 = Product(name: "Product 5")
//        let product6 = Product(name: "Product 6")
//        let products = [product1, product2, product3, product4, product5, product6].map({RxCellContainer(product:$0)})
//
//        return products
//    }
    
}
