//
//  WGCRefreshTableViewController.h
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCTableViewController.h"

@interface WGCRefreshTableViewController : WGCTableViewController

//subclass to override
- (void)updateData;
- (void)appendData;

@end
