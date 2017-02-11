//
//  WGCLineHelper.m
//  WGCKit
//
//  Created by Messi on 16/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCLineHelper.h"
#import <YYKit/YYKit.h>

static const CGFloat lineWidth = 1;
static const NSInteger topTag = 68329;
static const NSInteger bottomTag = 68330;

@implementation WGCLineHelper

+ (void)addTopLineToView:(UIView *)view leftOffset:(CGFloat)left rightOffset:(CGFloat)right color:(UIColor *)color {
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(left, 0, view.width-left-right, lineWidth)];
    
    line.tag = topTag;
    line.backgroundColor = color;
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    [view addSubview:line];
}

+ (void)addBottomLineToView:(UIView *)view leftOffset:(CGFloat)left rightOffset:(CGFloat)right color:(UIColor *)color {
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(left, view.height-lineWidth, view.width-left-right, lineWidth)];
    
    line.tag = bottomTag;
    line.backgroundColor = color;
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    [view addSubview:line];
}

+ (void)addTopLineToView:(UIView *)view {
    [self addTopLineToView:view leftOffset:0 rightOffset:0 color:[UIColor blackColor]];
}

+ (void)addBottomLineToView:(UIView *)view {
    [self addBottomLineToView:view leftOffset:0 rightOffset:0 color:[UIColor blackColor]];
}

+ (void)deleteTopLineOfView:(UIView *)view {
    UIView *line = [view viewWithTag:topTag];
    
    [line removeFromSuperview];
}

+ (void)deleteBottomLineOfView:(UIView *)view {
    UIView *line = [view viewWithTag:bottomTag];
    
    [line removeFromSuperview];
}

@end
