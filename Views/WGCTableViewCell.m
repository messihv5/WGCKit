//
//  WGCTableViewCell.m
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCTableViewCell.h"

@implementation WGCTableViewCell

+ (instancetype)cellForTableView:(UITableView *)tableView {
    NSString *className = NSStringFromClass(self);
    
    WGCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
    
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:className bundle:nil];
        
        NSAssert1(nib, @"Nib with name %@.xib not found!", className);
        
        [tableView registerNib:nib forCellReuseIdentifier:className];
        
        cell = [tableView dequeueReusableCellWithIdentifier:className];
    }
    
    return cell;
}

+ (void)registerForTableView:(UITableView *)tableView {
    NSString *className = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    NSAssert1(nib, @"Nib with name %@.xib not found!", nib);
    [tableView registerNib:nib forCellReuseIdentifier:className];
}

- (void)configCellWithModel:(id)model {
    
}

+ (CGFloat)cellHeight {
    return 44;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
