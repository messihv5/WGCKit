//
//  WGCTestViewController.m
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCTestViewController.h"
#import <YYKit/UIView+YYAdd.h>

@interface WGCTestViewController ()

@property (strong, nonatomic) UIButton *buttonOne;
@property (strong, nonatomic) UIButton *buttonTwo;

@end

@implementation WGCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_setupProperty];
}

#pragma mark - private method

- (void)p_setupProperty {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"VC";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //add button
    self.buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.buttonOne.backgroundColor = [UIColor greenColor];
    [self.buttonOne setTitle:@"MethodOne:showInfo" forState:UIControlStateNormal];
    [self.buttonOne setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.buttonOne.size = self.buttonOne.intrinsicContentSize;
    self.buttonOne.layer.cornerRadius = 10.0;
    [self.buttonOne addTarget:self action:@selector(p_showInfo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonOne];
    
    self.buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.buttonTwo.backgroundColor = [UIColor greenColor];
    [self.buttonTwo setTitle:@"MethodTwo" forState:UIControlStateNormal];
    [self.buttonTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.buttonTwo.size = self.buttonTwo.intrinsicContentSize;
    self.buttonTwo.top = self.buttonOne.bottom+10;
    self.buttonTwo.layer.cornerRadius = 10.0;
    [self.buttonTwo addTarget:self action:@selector(p_showHud:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonTwo];
    
}

- (void)p_showInfo:(UIButton *)button {
    [self showInfoWithInfo:@"loading..."];
}

- (void)p_showHud:(UIButton *)button {
    [self showHudWithInfo:@"loading..."];
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
