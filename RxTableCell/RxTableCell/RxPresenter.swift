//
//  RxPresenter.swift
//  RxTableCell
//
//  Created by MAXIM KOLESNIK on 06.11.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class RxPresenter {
    weak var view: RxTableViewController!
    var disposeBag = DisposeBag()

    func load() {
//        let product1 = Product(name: "Product 1")
//        let product2 = Product(name: "Product 2")
//        let product3 = Product(name: "Product 3")
//        let product4 = Product(name: "Product 4")
//        let product5 = Product(name: "Product 5")
//        let product6 = Product(name: "Product 6")
        
        
        //let products = MemoryStorage.shared.items
        let products = MemoryStorage.shared.items.map({RxCellContainer(product:$0, isSave:ProductStorage.isSave($0))})

        products.forEach { (container) in
            container.subject.asObservable().subscribe(onNext: { [weak self](product) in
                ProductStorage.action(container.product)
                print(ProductStorage.saveProducts.count)
                container.isSave = ProductStorage.isSave(container.product)
                self?.view.storage.manager.memoryStorage.reloadItem(container)
            }).disposed(by: disposeBag)
        }
        
        view.storage.manager.memoryStorage.setItems(products)

    }
    
}
