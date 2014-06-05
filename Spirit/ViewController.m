//
//  ViewController.m
//  Spirit
//
//  Created by 赵颖 on 14-3-16.
//  Copyright (c) 2014年 Ying.Zhao. All rights reserved.
//

#import "ViewController.h"
#import "ZYCollectionViewController.h"
#import "Cell.h"
#import "ZYurl.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RESideMenu.h"

#import "Spirit-Prefix.pch"


@interface ViewController ()

@end

@implementation ViewController

@synthesize collectionview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

//- (void)flushCache
//{
//    [SDWebImageManager.sharedManager.imageCache clearMemory];
//    [SDWebImageManager.sharedManager.imageCache clearDisk];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"豆瓣东西";
    // Do any additional setup after loading the view from its nib.
    UICollectionViewFlowLayout *layout = [[[ZYCollectionViewController alloc] init] createLayout];
    collectionview = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [collectionview setDataSource:self];
    [collectionview setDelegate:self];
    
    [collectionview registerClass:[Cell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [collectionview setBackgroundColor:[UIColor colorWithRed:224.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    
    [self.view addSubview:collectionview];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
