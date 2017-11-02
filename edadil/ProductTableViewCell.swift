//
//  ProductTableViewCell.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 27.10.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit
import DTModelStorage
import SnapKit

class ProductTableViewCell: UITableViewCell {

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "priceLabel"
        return label
    }()
    
    lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.text = "discountLabel"
        return label
    }()
    
    lazy var retailerLabel: UILabel = {
        let label = UILabel()
        label.text = "retailerLabel"
        return label
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()
    
    lazy var actionButton: UIButton = {
        let actionButton = UIButton()
        actionButton.backgroundColor = UIColor.blue
        actionButton.titleLabel?.text = "actionButton"
        return actionButton
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}

extension ProductTableViewCell: ModelTransfer {
    func update(with model: Product) {
        //self.textLabel?.text = model.text
        contentView.addSubview(productImageView)
        contentView.addSubview(actionButton)
        productImageView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.trailingMargin.top.equalTo(8)
        }
        actionButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.top.equalTo(productImageView.snp.bottom).offset(8)
            make.trailingMargin.equalTo(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(8).priority(999)

        }
        
        //print(model.text)
    }
}
