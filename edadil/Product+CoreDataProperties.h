//
//  Product+CoreDataProperties.h
//  
//
//  Created by MAXIM KOLESNIK on 27.10.2017.
//
//

#import "Product+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Product (CoreDataProperties)

+ (NSFetchRequest<Product *> *)fetchRequest;

@property (nonatomic) int64_t discount;
@property (nullable, nonatomic, copy) NSString *image;
@property (nonatomic) int64_t price;
@property (nullable, nonatomic, copy) NSString *retailer;
@property (nullable, nonatomic, copy) NSString *text;

@end

NS_ASSUME_NONNULL_END
