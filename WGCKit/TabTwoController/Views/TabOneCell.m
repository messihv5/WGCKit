//
//  TabOneCell.m
//  WGCKit
//
//  Created by Messi on 04/02/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "TabOneCell.h"
#import "TabOneModel.h"

@interface TabOneCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imv;

@end

@implementation TabOneCell

- (void)configCellWithModel:(id)model {
    TabOneModel *data = model;
    
    self.nameLabel.text = data.name;
    self.imv.image = data.image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
