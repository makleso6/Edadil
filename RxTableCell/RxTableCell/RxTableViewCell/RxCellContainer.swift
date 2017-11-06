//
//  RxCellContainer.swift
//  RxTableCell
//
//  Created by MAXIM KOLESNIK on 06.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class RxCellContainer {
    var product: Product
//    var observable = Observable<Void>.empty()
//    var varible: Variable<Product>
    var subject = PublishSubject<Void>()
    var isSave: Bool
    init(product: Product, isSave: Bool) {
        self.product = product
        self.isSave = isSave
        //varible = Variable(product)
    }
}


extension RxCellContainer: Equatable {
    public static func ==(lhs: RxCellContainer, rhs: RxCellContainer) -> Bool {
        return lhs.product == rhs.product
        
    }

}
