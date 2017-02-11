//
//  WGCTableViewCell.h
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGCTableViewCell : UITableViewCell

//load cell for the tableView from nib named with self class. Non nil.
+ (instancetype)cellForTableView:(UITableView *)tableView;

+ (void)registerForTableView:(UITableView *)tableView;

- (void)configCellWithModel:(id)model;

+ (CGFloat)cellHeight;

@end
