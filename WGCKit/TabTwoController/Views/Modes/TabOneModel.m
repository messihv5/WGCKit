//
//  TabOneModel.m
//  WGCKit
//
//  Created by Messi on 13/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "TabOneModel.h"

@implementation TabOneModel

- (id)initWithName:(NSString *)name image:(UIImage *)image {
    self = [self init];
    if (self) {
        _name  = name;
        _image = image;
    }
    return self;
}

@end
