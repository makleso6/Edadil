//
//  Product+CoreDataProperties.m
//  
//
//  Created by MAXIM KOLESNIK on 03.11.2017.
//
//

#import "Product+CoreDataProperties.h"

@implementation Product (CoreDataProperties)

+ (NSFetchRequest<Product *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Product"];
}

@dynamic discount;
@dynamic image;
@dynamic price;
@dynamic retailer;
@dynamic text;
@dynamic isSave;

@end
