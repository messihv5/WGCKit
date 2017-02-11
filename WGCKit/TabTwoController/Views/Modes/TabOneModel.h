//
//  TabOneModel.h
//  WGCKit
//
//  Created by Messi on 13/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TabOneModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *image;

- initWithName:(NSString *)name image:(UIImage *)image;

@end
