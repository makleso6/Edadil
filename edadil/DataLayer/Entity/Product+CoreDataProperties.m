//
//  Product+CoreDataProperties.m
//  
//
//  Created by MAXIM KOLESNIK on 27.10.2017.
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

@end
