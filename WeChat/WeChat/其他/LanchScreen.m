//
//  LanchScreen.m
//  WeChat
//
//  Created by du-lq on 2018/12/21.
//  Copyright © 2018 du-lq. All rights reserved.
//

#import "LanchScreen.h"

@implementation LanchScreen

- (void)drawRect:(CGRect)rect
{
    UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"12345.jpg"]];
    [self addSubview:img];
    img.contentMode=UIViewContentModeScaleToFill;
}

@end
