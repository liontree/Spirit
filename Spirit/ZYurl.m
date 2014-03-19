//
//  ZYurl.m
//  Spirit
//
//  Created by 赵颖 on 14-3-16.
//  Copyright (c) 2014年 Ying.Zhao. All rights reserved.
//

#import "ZYurl.h"
#import "HTMLNode.h"
#import "HTMLParser.h"

@class HTMLNode;
@class HTMLParser;

@implementation ZYurl

+(NSString *)getUrl : (NSString *)host
{
    /*
     host = @"http://dongxi.douban.com/"
     */
    NSURL *url = [NSURL URLWithString:host];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSHTTPURLResponse *response = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
//    NSLog(@"responseData is %@", result);
    
    return result;
}

//<div class="card-hd">
//
//
//<a target="_blank" href="http://dongxi.douban.com/show/1075383/?r=C" title="【icatlife】zakka 木头 玻璃 把手抽屉柜 两款可选">
//<img class="story-image" width="347" height="260" src="http://img5.douban.com/view/commodity_story/large/public/p1122387.jpg" alt="【icatlife】zakka 木头 玻璃 把手抽屉柜 两款可选的图片" style="margin-left:-23.5px;">
//</a>
//
//<span class="commodity-price">￥105.00</span>
//</div>

+(NSMutableArray *)getCellContents:(NSString *)host
{
    NSString *html = [ZYurl getUrl:host];
    NSError *error = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithString:html error:&error];
    if (error) {
        NSLog(@"Error: %@", error);
    }
    HTMLNode *bodyNode = [parser body];
    NSArray *cellContents = [bodyNode findChildrenOfClass:@"card-main"];
    
    NSMutableArray *contentsForView = [[NSMutableArray alloc] init];
    for(HTMLNode *content in cellContents)
    {
        NSMutableDictionary *cellDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                               @"src",@"title",nil];
        NSString *src = [[content findChildOfClass:@"story-image"] getAttributeNamed:@"src"];
        NSString *title = [[content findChildOfClass:@"story-title"] getAttributeNamed:@"title"];
        [cellDictionary setObject:src forKey:@"src"];
        [cellDictionary setObject:title forKey:@"title"];
        [contentsForView addObject:cellDictionary];
    }
    return contentsForView;
}


@end
