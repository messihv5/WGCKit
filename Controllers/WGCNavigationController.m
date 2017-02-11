//
//  WGCNavigationController.m
//  WGCKit
//
//  Created by Messi on 24/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCNavigationController.h"

@interface WGCNavigationController ()<UINavigationControllerDelegate>

@end

@implementation WGCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController == self.viewControllers[0]) {
        
        return;
    } else {
        if (viewController.navigationItem.leftBarButtonItem || viewController.navigationItem.leftBarButtonItems.count) {
            
            return;
        }
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
         UIImage *image = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        leftButton.frame = CGRectMake(0, 0, 40, 30);
        leftButton.tintColor = self.backTintColor;
        
        [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -14.5, 0, +14.5)];
        [leftButton setImage:image forState:UIControlStateNormal];
        [leftButton setImage:image forState:UIControlStateHighlighted];
        
        if ([viewController respondsToSelector:@selector(onBackButtonClicked:)]) {
            [leftButton addTarget:viewController action:@selector(onBackButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        } else {
            [leftButton addTarget:self action:@selector(onBackButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
}

#pragma mark - event response

- (void)onBackButtonClicked:(UIButton *) button {
    [self popViewControllerAnimated:YES];
}

#pragma mark - statusBarStyle

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.statusBarStyle;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
