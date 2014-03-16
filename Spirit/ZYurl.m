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

+(NSMutableArray *)getImgArray:(NSString *)host
{
    NSString *html = [ZYurl getUrl:host];
    NSError *error = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithString:html error:&error];
    if (error) {
        NSLog(@"Error: %@", error);
    }
    HTMLNode *bodyNode = [parser body];
    NSMutableArray *urlImgArray = [[NSMutableArray alloc] init];
    
    NSArray *divNodes = [bodyNode findChildrenOfClass:@"card-hd"];
    for(HTMLNode *divNode in divNodes)
    {
        NSString *src = [[divNode findChildOfClass:@"story-image"] getAttributeNamed:@"src"];
        NSLog(@"src is %@", src);
        if(src)
        {
            [urlImgArray addObject:src];
        }
    }
    
    return urlImgArray;
}

+(NSMutableArray *)getTitleArray:(NSString *)host
{
    NSString *html = [ZYurl getUrl:host];
    NSError *error = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithString:html error:&error];
    if (error) {
        NSLog(@"Error: %@", error);
    }
    HTMLNode *bodyNode = [parser body];
    NSMutableArray *urlTitleArray = [[NSMutableArray alloc] init];
    if(bodyNode)
    {
        NSArray *divNodes = [bodyNode findChildrenOfClass:@"card-bd"];
        
        for(HTMLNode *divNode in divNodes)
        {
            NSString *title = [[divNode findChildOfClass:@"story-title"] getAttributeNamed:@"title"];
            NSLog(@"title is %@", title);
            if(title)
            {
                [urlTitleArray addObject:title];
            }
        }
    }
    else
    {
        NSLog(@"error..");
    }
    return urlTitleArray;
}

@end
