//
//  ProductStorage.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 03.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit
//import MagicalRecord
struct ProductStorage {
    
    static var saveProducts: [Product] {
        
        let products = allProducts//MemoryStorage.shared.items//Product.mr_findAll() as? [Product] ?? [Product]()
        let defaults = UserDefaults.standard
        //products
        return products.filter({defaults.bool(forKey: $0.name)})
    }
    
    static var allProducts: [Product] {
        return MemoryStorage.shared.items
    }
    
    static func isSave(_ product: Product) -> Bool {
        let name = product.name 
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: name)
    }
    
    static func action(_ product: Product) {
        let name = product.name
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: name) {
            delete(product)
        } else {
            save(product)
        }
    }
    
    static func save(_ product: Product) {
        let name = product.name// else { return }
        UserDefaults.standard.set(true, forKey: name)
        
    }
    
    static func delete(_ product: Product) {
        let name = product.name //else { return }
        UserDefaults.standard.set(false, forKey: name)
    }
}
