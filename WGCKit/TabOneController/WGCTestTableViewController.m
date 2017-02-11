//
//  WGCTestTableViewController.m
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCTestTableViewController.h"
#import "TabOneModel.h"
#import "TabOneCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "WGCLoopView.h"
#import <YYKit.h>
#import "WGCLineHelper.h"

@interface WGCTestTableViewController ()<WGCLoopViewDelegate>

@property (strong, nonatomic) WGCLoopView *loopView;

@end

@implementation WGCTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self p_setupProperty];
    
    //must first register to use UITableView+FDTemplateLayoutCell
    [TabOneCell registerForTableView:self.tableView];

    [self p_loadData];
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.tableView.tableHeaderView = self.loopView;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TabOneCell *cell = [TabOneCell cellForTableView:tableView];
    TabOneModel *model = self.data[indexPath.row];
    [cell configCellWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TabOneModel *model = self.data[indexPath.row];
    //use keyedHeightCache
//    return [tableView fd_heightForCellWithIdentifier:@"TabTwoCell" cacheByKey:indexPath configuration:^(id cell) {
//        [cell configCellWithModel:model];
//    }];
    
    //use indexPathHeightCache
    return [tableView fd_heightForCellWithIdentifier:@"TabOneCell" cacheByIndexPath:indexPath configuration:^(id cell) {
        [cell configCellWithModel:model];
    }];
}

#pragma mark - WGCLoopViewDelegate 

- (void)loopView:(WGCLoopView *)loopView didSelectAtIndex:(NSInteger)index {
    NSLog(@"%ld", index);
}

#pragma mark - private method

- (void)p_setupProperty {
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"TableVC";
}

- (void)p_loadData {
    TabOneModel *one = [[TabOneModel alloc] initWithName:@"LionelMessi" image:[UIImage imageNamed:@"1"]];
    
    TabOneModel *two = [[TabOneModel alloc] initWithName:@"Xavi" image:[UIImage imageNamed:@"2"]];
    TabOneModel *three = [[TabOneModel alloc] initWithName:@"Iniesta" image:[UIImage imageNamed:@"3"]];
    
    self.data = @[one, two, three].mutableCopy;
}

#pragma mark - setter&getter 

- (WGCLoopView *)loopView {
    if (!_loopView) {
        _loopView = [[WGCLoopView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
        _loopView.imageSource = @[@"1", @"2", @"3"];
        _loopView.pagingEnabled = YES;
        _loopView.isAutoLoop = YES;
        _loopView.loopDelegate = self;
    }
    return _loopView;
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
