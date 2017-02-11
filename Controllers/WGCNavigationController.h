//
//  WGCNavigationController.h
//  WGCKit
//
//  Created by Messi on 24/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGCNavigationController : UINavigationController

// set statusBarStyle.
@property (assign, nonatomic) UIStatusBarStyle statusBarStyle;

@property (strong, nonatomic) UIColor *backTintColor;

@end
