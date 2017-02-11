//
//  WGCViewController.m
//  WGCKit
//
//  Created by messihv5 on 04/01/2017.
//  Copyright © 2017 messihv5. All rights reserved.
//

#import "WGCViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface WGCViewController ()

@end

@implementation WGCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - public method

- (void)showInfoWithInfo:(NSString *)info {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = info;
    [hud hideAnimated:YES afterDelay:1.0];
}

- (void)showHudWithInfo:(NSString *)info {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = info;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:2];
    
    [self.view addSubview:hud];
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
