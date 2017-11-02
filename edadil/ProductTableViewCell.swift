//
//  ProductTableViewCell.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 27.10.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit
import DTModelStorage

class ProductTableViewCell: UITableViewCell {
    
}

extension ProductTableViewCell: ModelTransfer {
    func update(with model: Product) {
        self.textLabel?.text = model.text
        //print(model.text)
    }
}
