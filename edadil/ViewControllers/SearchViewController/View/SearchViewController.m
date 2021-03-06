//
//  SearchViewController.m
//  edadil
//
//  Created by MAXIM KOLESNIK on 27.10.2017.
//  Copyright © 2017 Maxim Kolesnik. All rights reserved.
//

#import "SearchViewController.h"
#import "edadil-Swift.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Product+CoreDataProperties.h"
#import "Product+CoreDataClass.h"

@interface SearchViewController () <SearchDecoratorable, UISearchBarDelegate>
@property (nonatomic, strong) SearchDecorator *decorator;
@property (nonatomic, strong) SearchPresenter *presenter;
@property (nonatomic, strong) UISearchController *searchController;


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.searchController.searchBar.delegate = self;
    self.decorator = [[SearchDecorator alloc] init];
    self.presenter = [[SearchPresenter alloc] init];
    self.decorator.objectToDecorate = self;
    [self.presenter load];
    [self.decorator decorate];
    
    
    
    [self searchWith:nil];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[self.presenter load];
    //[self searchWith:self.searchController.searchBar.text];
    [self.decorator setWithData: [self.presenter searchWithText:self.searchController.searchBar.text]];

    //[self.decorator decorate];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchWith:(NSString *)searchText {
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
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.decorator setWithData: [self.presenter searchWithText:searchText]];
   
///    [self searchWith:searchText];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //[self searchWith:nil];
    [self.decorator setWithData: [self.presenter searchWithText:nil]];

}

@end
