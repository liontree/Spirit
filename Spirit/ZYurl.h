//
//  ZYurl.h
//  Spirit
//
//  Created by 赵颖 on 14-3-16.
//  Copyright (c) 2014年 Ying.Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYurl : NSString

+(NSMutableArray *)getImgArray:(NSString *)host;

+(NSMutableArray *)getTitleArray:(NSString *)host;

@end
