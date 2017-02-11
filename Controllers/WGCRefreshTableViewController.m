//
//  WGCRefreshTableViewController.m
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCRefreshTableViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface WGCRefreshTableViewController ()

@end

@implementation WGCRefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_setupTableViewRefresh];
}


#pragma mark - public method

// subclass to override
- (void)updateData {
}

- (void)appendData {
}

#pragma mark - private method

- (void)p_setupTableViewRefresh {
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        typeof(self) strongSelf = weakSelf;
        [strongSelf updateData];
        [strongSelf.tableView.mj_header endRefreshing];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        typeof(self) strongSelf = weakSelf;
        [strongSelf appendData];
        [strongSelf.tableView.mj_footer endRefreshing];
    }];
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
