//
//  loginView.m
//  WeChat
//
//  Created by du-lq on 2018/11/6.
//  Copyright © 2018 du-lq. All rights reserved.
//

#import "loginView.h"

@implementation loginView

- (void)drawRect:(CGRect)rect{
    UIImage *image = [UIImage imageNamed:@"12345.jpg"];
//    [image drawInRect:rect];
    [image drawAsPatternInRect:rect];
}

@end
