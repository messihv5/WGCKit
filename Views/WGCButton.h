//
//  WGCButton.h
//  CustomViewTopBar
//
//  Created by messihv5 on 28/12/2016.
//  Copyright © 2016 messihv5. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WGCButtonType) {
    WGCButtonTypeImageTop,
    WGCButtonTypeImageLeft,
    WGCButtonTypeImageBottom,
    WGCButtonTypeImageRight
};

@interface WGCButton : UIButton

//init with a custom buttonType
- (instancetype)initWithButtonType:(WGCButtonType)buttonType;

//the padding between the imageView and label.
@property (assign, nonatomic) float padding;

//set the buttonType
@property (assign, nonatomic) WGCButtonType wGCButtonType;

@end
