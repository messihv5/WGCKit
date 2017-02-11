//
//  WGCLoopView.h
//  WGCKit
//
//  Created by Messi on 15/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WGCLoopView;

@protocol WGCLoopViewDelegate <NSObject>

- (void)loopView:(WGCLoopView *)loopView didSelectAtIndex:(NSInteger)index;

@end

@interface WGCLoopView : UIScrollView

//used to set the loop imageSource, local or from internet
@property (copy  , nonatomic) NSArray *imageSource;

//set the delegate to handle tap event.
@property (weak  , nonatomic) id<WGCLoopViewDelegate> loopDelegate;

//whether autoLoop the image or not, default is yes.
@property (assign, nonatomic) BOOL isAutoLoop;

//default pageControl.
@property (strong, nonatomic) UIPageControl *pageControl;

@end
