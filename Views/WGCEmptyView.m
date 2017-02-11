//
//  WGCEmptyView.m
//  WGCKit
//
//  Created by Messi on 16/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCEmptyView.h"
#import <YYKit/YYKit.h>

@interface WGCEmptyView ()

@property (strong, nonatomic) UILabel     *titleLabel;
@property (strong, nonatomic) UIImageView *imagv;
@property (strong, nonatomic) UIView      *container;

@end

@implementation WGCEmptyView

#pragma mark - initializer.

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _title = title;
        _imageName = imageName;
        
        self.backgroundColor = [UIColor clearColor];
        
        [self p_setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithTitle:nil imageName:nil];
}

- (instancetype)init {
    return [self initWithTitle:nil imageName:nil];
}

#pragma mark - private method.

- (void)p_setup {
    if (_imageName) {
        
        if (!_imagv) {
            
            _imagv = [[UIImageView alloc] init];
        }
        
        _imagv.image = [UIImage imageNamed:_imageName];
        _imagv.size = _imagv.image.size;
        
    } else {
        _imagv = nil;
    }
    
    if (_title) {
        if (!_titleLabel) {
            
            _titleLabel = [[UILabel alloc] init];
        }
        
        _titleLabel.text = _title;
        _titleLabel.size = _titleLabel.intrinsicContentSize;
        
    } else {
        _titleLabel = nil;
    }
    
    if (!_container) {
        _container = [[UIView alloc] init];
    }
    
    [_container addSubview:_titleLabel];
    [_container addSubview:_imagv];
    
    [self p_configureContainer];
    
    [self addSubview:_container];
}

- (void)p_configureContainer {
    CGFloat maxWidth = MAX(_titleLabel.width, _imagv.width);
    
    _container.width = maxWidth;
    _container.height = _imagv.height + _titleLabel.height;
    
    _imagv.centerX = maxWidth / 2;
    _titleLabel.centerX = maxWidth / 2;
    _titleLabel.top = _imagv.height;
}

#pragma mark - view transition

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _container.center = self.center;

}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        self.frame = newSuperview.bounds;
    }
}

#pragma mark - setter&getter 

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    
    [self p_setup];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    [self p_setup];
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
