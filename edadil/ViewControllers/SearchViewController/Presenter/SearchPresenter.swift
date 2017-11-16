//
//  SearchPresenter.swift
//  edadil
//
//  Created by MAXIM KOLESNIK on 27.10.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

import Foundation
import Alamofire
import MagicalRecord

@objc public class SearchPresenter: NSObject {
    
   @objc public func load() {
        SessionManager.default.request("https://api.edadev.ru/intern/").responseJSON { (response) in
            if let responseData = response.result.value as? [[AnyHashable: Any]]  {
                Product.saveEntities(onSerialQueue: responseData, deleteUnmatched: true, completionOnMainThread: { (products) in
                    
                   let a =  Product.mr_findAll()
                    //print("a")
                    //print(a)
                    //print("a")
                })
            }
        }
    }
    
    /*
     NSPredicate *predicate = nil;
     if (searchText.length > 0) {
     predicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@",@"text", searchText];
     }
     
     NSArray *products = [Product MR_findAllSortedBy:@"text" ascending:YES withPredicate:predicate];
     if (searchText.length > 0) {
     products = [products sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
     Product *product1 = obj1;
     Product *product2 = obj2;
     NSRange range1 = [product1.text rangeOfString:searchText options:NSCaseInsensitiveSearch range:NSMakeRange(0,product1.text.length)];
     NSRange range2 = [product2.text rangeOfString:searchText options:NSCaseInsensitiveSearch range:NSMakeRange(0,product2.text.length)];
     return range1.location > range2.location;
     }];
     }
     
     [self.decorator setWithData:products];
     */
    
    @objc public func search(text: String?) -> [Product]{
        guard let text = text else { return [] }
        var predicate: NSPredicate?/// = NSPredicate()
        if text.characters.count == 0 {
            return []
        }
        if text.characters.count > 0 {
            predicate = NSPredicate(format: "%K CONTAINS[cd] %@", "text", text)
        }
        
        
        
        guard let products = Product.mr_findAllSorted(by: "text", ascending: true, with: predicate) as? [Product] else { return [] }
        let sorted = products.sorted { (lhs, rhs) -> Bool in
            guard let lhsText = lhs.text else { return false }
            guard let rhsText = rhs.text else { return false }

            guard let lhsRange = lhsText.range(of: text) else { return false }
            guard let rhsRange = rhsText.range(of: text) else { return false }

            let index: Int = lhsText.distance(from: lhsText.startIndex, to: lhsRange.lowerBound)
            let index2: Int = rhsText.distance(from: rhsText.startIndex, to: rhsRange.lowerBound)

            return index > index2
        }
        let textArray = sorted.flatMap({$0.text})
        
        
        return sorted
    }
}
