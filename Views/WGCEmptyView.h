//
//  WGCEmptyView.h
//  WGCKit
//
//  Created by Messi on 16/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import <UIKit/UIKit.h>

//when loading data, if there is no data loaded, you can use this view, it can configure with a title and a image.
//when it is added to superview, it's frame is set to superview's bounds.

@interface WGCEmptyView : UIView

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *imageName;

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName;// Designated initializer.

@end
