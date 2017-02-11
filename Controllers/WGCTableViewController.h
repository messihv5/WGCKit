//
//  WGCTableViewController.h
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCViewController.h"

@interface WGCTableViewController : WGCViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic, readonly) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;

@end
