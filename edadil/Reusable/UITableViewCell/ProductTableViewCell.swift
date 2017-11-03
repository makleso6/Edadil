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
        label.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        label.text = "priceLabel"
        return label
    }()
    
    lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        label.text = "discountLabel"
        return label
    }()
    
    lazy var retailerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        label.text = "retailerLabel"
        return label
    }()
    
    lazy var descriptionLabel: UITextView = {
        let textView = UITextView()
        //label.numberOfLines = 0
        textView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.text = "descriptionLabel"
        return textView
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
        productImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.trailingMargin.top.equalTo(8)
        }
        actionButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.top.equalTo(productImageView.snp.bottom).offset(8)
            make.trailingMargin.equalTo(8)
            make.bottomMargin.equalTo(-8).priority(999)
        }
        
        if let text = model.text {
            contentView.addSubview(descriptionLabel)
            descriptionLabel.text = text
            descriptionLabel.snp.makeConstraints { (make) in
                make.top.leading.equalTo(8)
                make.trailing.equalTo(productImageView.snp.leading).offset(-8)
                //make.bottomMargin.equalTo(-8).priority(999)

            }
        }
        
        if let retailer = model.retailer {
            contentView.addSubview(retailerLabel)
            retailerLabel.text = retailer
            
            retailerLabel.snp.makeConstraints { (make) in
                make.leading.equalTo(8)
                make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
                make.trailing.equalTo(productImageView.snp.leading).offset(-8)
                //make.bottomMargin.equalTo(-8).priority(999)
                
            }
        }
        
        //if let retailer = model.price {
            contentView.addSubview(priceLabel)
            priceLabel.text = "\(model.price)"
            
            priceLabel.snp.makeConstraints { (make) in
                make.leading.equalTo(8)
                make.top.equalTo(retailerLabel.snp.bottom).offset(8)
                //make.trailing.equalTo(productImageView.snp.leading).offset(-8)
                //make.bottomMargin.equalTo(-8).priority(999)
                
            }
        //if let discount = model.discount
        contentView.addSubview(discountLabel)
        discountLabel.text = "\(model.discount)"

        discountLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(priceLabel.snp.trailing).offset(8)
            make.trailing.equalTo(productImageView.snp.leading).offset(-8)
            make.top.equalTo(retailerLabel.snp.bottom).offset(8)
            //make.trailing.equalTo(productImageView.snp.leading).offset(-8)
            make.bottomMargin.equalTo(-8).priority(999)
            
        }
        
    }
}
