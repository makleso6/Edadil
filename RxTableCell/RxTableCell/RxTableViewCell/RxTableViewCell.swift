//
//  RxTableViewCell.swift
//  RxTableCell
//
//  Created by MAXIM KOLESNIK on 06.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import UIKit
import DTModelStorage
import RxCocoa
import RxSwift

class RxTableViewCell: UITableViewCell {
    var actionButton: UIButton!
    var disposeBag = DisposeBag()
}


extension RxTableViewCell: ModelTransfer {
    func update(with model: RxCellContainer) {
        disposeBag = DisposeBag()
        self.textLabel?.text = model.product.name
        actionButton = UIButton(type: UIButtonType.system)
        let title = model.isSave ? "Remove" : "Add"
        actionButton.setTitle(title, for: UIControlState.normal)//titleLabel?.text = "Add"
        actionButton.sizeToFit()
        //ObservableType
        
        //model.observable.as
        actionButton.rx.tap.bind(to: model.subject).disposed(by: disposeBag)
        //actionButton.rx.tap.map({model.product}).bind(to: model.varible).disposed(by: disposeBag)
        
        //        tap.asObservable().bind { (<#Observable<Void>#>) -> R in
//            <#code#>
//        }//asObservable().bind(to: <#T##(Observable<Void>) -> R#>)
        
        accessoryView = actionButton

    }
}
