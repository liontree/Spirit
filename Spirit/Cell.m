//
//  Cell.m
//  Spirit
//
//  Created by 赵颖 on 14-3-16.
//  Copyright (c) 2014年 Ying.Zhao. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize imageView;
@synthesize textView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
        textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 300, 320, 60)];
        textView.font = [UIFont fontWithName:@"Arial" size:16.0];
        textView.editable = false;
        textView.scrollEnabled = NO;
        
        [self addSubview:imageView];
        [self addSubview:textView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
