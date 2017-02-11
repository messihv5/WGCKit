//
//  WGCTestRefreshTableViewController.m
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCTestRefreshTableViewController.h"
#import "EmptyViewController.h"
#import "WGCLineHelper.h"

@interface WGCTestRefreshTableViewController ()

@end

@implementation WGCTestRefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_setupProperty];
    
    [self p_loadData];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    cell.textLabel.text = self.data[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [WGCLineHelper addBottomLineToView:cell leftOffset:20 rightOffset:20 color:[UIColor cyanColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (!indexPath.row) {
        EmptyViewController *emptyVC = [[EmptyViewController alloc] init];
        
        [self.navigationController pushViewController:emptyVC animated:YES];
    }
}

#pragma mark - private method

- (void)p_loadData {
    self.data = @[@"showEmptyView", @"Pacquiao", @"GGG"].mutableCopy;
}

- (void)p_setupProperty {
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"RefreshVC";
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
