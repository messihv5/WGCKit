//
//  EmptyViewController.m
//  WGCKit
//
//  Created by Messi on 16/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "EmptyViewController.h"
#import "WGCEmptyView.h"

@interface EmptyViewController ()

@property (strong) WGCEmptyView *emptyView;

@end

@implementation EmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_setup];
}

#pragma mark - private method.

- (void)p_setup {
    self.emptyView = [[WGCEmptyView alloc] initWithTitle:@"No data, sorry!" imageName:@"1"];
    
    [self.view addSubview:self.emptyView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    [self.emptyView addGestureRecognizer:tap];
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    self.emptyView.imageName = @"2";
    self.emptyView.title = @"We are changing title!";
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
