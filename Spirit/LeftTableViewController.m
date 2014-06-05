//
//  LeftTableViewController.m
//  Spirit
//
//  Created by 赵颖 on 14-6-4.
//  Copyright (c) 2014年 Ying.Zhao. All rights reserved.
//

#import "LeftTableViewController.h"
#import "RESideMenu.h"
#import "ZYCollectionViewController.h"
#import "Spirit-Prefix.pch"
#import "ViewController.h"

@interface LeftTableViewController()

@property (nonatomic, strong) NSArray *menu;

@end

@implementation LeftTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _menu = [[NSArray alloc] initWithObjects:@"男士",@"女士",@"家居", @"数码", @"户外", @"Geek", @"设计感", nil];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 80, 200, 350) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.dataSource = self;
    tableView.opaque = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.bounces = NO;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [_menu objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void) showCategory:(NSString* )host
{
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc]
                                                           initWithRootViewController:[[ViewController alloc] init]] animated:YES];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self showCategory:HOST_MAN];
            break;
        case 1:
//            [self showBeeUrl];
            break;
        case 2:
//            [self showShopUrl];
            break;
        case 3:
//            [self hotSearch];
            break;
        case 4:
//            [self starshopSearch];
            break;
        default:
            break;
    }
}


@end