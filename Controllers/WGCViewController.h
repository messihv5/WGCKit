//
//  WGCViewController.h
//  WGCKit
//
//  Created by messihv5 on 04/01/2017.
//  Copyright © 2017 messihv5. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGCViewController : UIViewController

//show the 'info' to VC and hide after seconds.
- (void)showInfoWithInfo:(NSString *)info;

//show a hud with the 'info' to VC and hide after seconds.
- (void)showHudWithInfo:(NSString *)info;

@end
