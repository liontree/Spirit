//
//  ZYCollectionViewController.h
//  Spirit
//
//  Created by 赵颖 on 14-3-16.
//  Copyright (c) 2014年 Ying.Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYCollectionViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

- (UICollectionViewFlowLayout *)createLayout;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSString *host;

@end
