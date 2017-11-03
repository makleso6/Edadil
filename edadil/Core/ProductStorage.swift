//
//  ProductStorage.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 03.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit
import MagicalRecord
struct ProductStorage {
    
    static var saveProducts: [Product] {
        
        let products = Product.mr_findAll() as? [Product] ?? [Product]()
        let defaults = UserDefaults.standard
        //products
        return products.filter({defaults.bool(forKey: $0.text ?? "")})
    }
    
    static func isSave(_ product: Product) -> Bool {
        guard let name = product.text else { return false }
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: name)
    }
    
    static func action(_ product: Product) {
        guard let name = product.text else { return }
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: name) {
            delete(product)
        } else {
            save(product)
        }
    }
    
    static func save(_ product: Product) {
        guard let name = product.text else { return }
        UserDefaults.standard.set(true, forKey: name)
        
    }
    
    static func delete(_ product: Product) {
        guard let name = product.text else { return }
        UserDefaults.standard.set(false, forKey: name)
    }
}
