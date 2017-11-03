//
//  TableViewCell.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 02.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit
import DTModelStorage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TableViewCell: ModelTransfer {
    func update(with model: Product) {
        descLabel.text = model.text
    }
}
