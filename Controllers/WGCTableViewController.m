//
//  WGCTableViewController.m
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "WGCTableViewController.h"

@interface WGCTableViewController ()

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation WGCTableViewController

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *reason = [NSString stringWithFormat:@"%@ needs to be overrided", NSStringFromSelector(_cmd)];
    
    [NSException raise:NSInternalInconsistencyException format:@"%@", reason];
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reason = [NSString stringWithFormat:@"%@ needs to be overided", NSStringFromSelector(_cmd)];
    
    [NSException raise:NSInternalInconsistencyException format:@"%@", reason];
    
    return nil;
}

#pragma mark - setter&getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return _tableView;
}

- (void)setData:(NSMutableArray *)data {
    if (_data == data) {
        return;
    }
    
    _data = data;
    
    [self.tableView reloadData];
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
