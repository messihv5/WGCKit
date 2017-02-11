//
//  WGCLineHelper.h
//  WGCKit
//
//  Created by Messi on 16/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WGCLineHelper : NSObject

+ (void)addTopLineToView:(UIView *)view;
+ (void)addBottomLineToView:(UIView *)view;
+ (void)addTopLineToView:(UIView *)view leftOffset:(CGFloat)left rightOffset:(CGFloat)right color:(UIColor *)color;
+ (void)addBottomLineToView:(UIView *)view leftOffset:(CGFloat)left rightOffset:(CGFloat)right color:(UIColor *)color;

+ (void)deleteTopLineOfView:(UIView *)view;
+ (void)deleteBottomLineOfView:(UIView *)view;

@end
