//
//  WGCLoopView.m
//  WGCKit
//
//  Created by Messi on 15/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCLoopView.h"
#import <YYKit/YYKit.h>

@interface WGCLoopView ()<UIScrollViewDelegate>

@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger currentIndexOfImage;

@end

@implementation WGCLoopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _isAutoLoop = YES;
        [self p_setup];
    }
    return self;
}

#pragma mark - life cycle

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    [self.superview addSubview:self.pageControl];
}

#pragma mark - setter&getter

- (void)setImageSource:(NSArray *)imageSource {
    _imageSource = imageSource.copy;
    
    //if imageSource is nil or count is 0, generate an assertion.
    NSAssert(imageSource || imageSource.count, @"imageSource is nil!");
    
    for (int i = 0; i < imageSource.count; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.width, 0, self.width, self.height)];
                
        imageView.tag = i;
        
        if ([_imageSource[i] hasPrefix:@"http"]) {
            
            imageView.imageURL = _imageSource[i];
            
        } else {
            
            imageView.image = [UIImage imageNamed:_imageSource[i]];
            
        }
        
        [self addSubview:imageView];
    }
    
    [self setContentSize:CGSizeMake(self.width * _imageSource.count, self.height)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    [self addGestureRecognizer:tap];
    
    self.pageControl.numberOfPages = imageSource.count;
}

- (void)setIsAutoLoop:(BOOL)isAutoLoop {
    _isAutoLoop = isAutoLoop;
    
    if (_isAutoLoop) {
        [self p_startLoop];
    } else {
        [self p_stopLoop];
    }
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, self.width, 20)];
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
        _pageControl.centerX = self.centerX;
        _pageControl.bottom = self.bottom;
        _pageControl.backgroundColor = [UIColor whiteColor];
    }
    return _pageControl;
}

#pragma mark - response

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    CGPoint offset = self.contentOffset;
    
    NSInteger index = ceil(offset.x/self.width);
    
    if (self.loopDelegate && [self.loopDelegate respondsToSelector:@selector(loopView:didSelectAtIndex:)]) {
        [self.loopDelegate loopView:self didSelectAtIndex:index];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self p_stopLoop];
    
    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, 6*NSEC_PER_SEC);
    
    dispatch_after(t, dispatch_get_main_queue(), ^{
        [self p_startLoop];
    });
}

#pragma mark - private method.

- (void)p_startLoop {
    if (self.timer || !self.isAutoLoop) {
        return;
    }
    
    self.currentIndexOfImage = 0;
    
    __weak typeof(self) weakSelf = self;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        typeof(self) strongSelf = weakSelf;
        
        if (self.currentIndexOfImage>strongSelf.imageSource.count-1) {
            
            self.currentIndexOfImage = 0;
            
        }
        
        self.contentOffset = CGPointMake(strongSelf.width*self.currentIndexOfImage, 0);
        
        [self scrollViewDidEndDecelerating:self];
        
        self.currentIndexOfImage++;
    }];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)p_stopLoop {
    [self.timer invalidate];
    
    self.timer = nil;
}

- (void)p_setup {
    self.delegate = self;
    
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    
    NSInteger indexOfImage = offset.x / self.width;
    
    self.pageControl.currentPage = indexOfImage;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
