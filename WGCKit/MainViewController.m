//
//  MainViewController.m
//  WGCKit
//
//  Created by Messi on 04/01/2017.
//  Copyright © 2017 WGC. All rights reserved.
//

#import "MainViewController.h"
#import "WGCTestViewController.h"
#import "WGCTestTableViewController.h"
#import "WGCTestRefreshTableViewController.h"
#import <RDVTabBarItem.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_setupViewControllers];
    
    [self p_setupTabBarItems];
}

- (void)p_setupViewControllers {
    //tab 0
    WGCViewController *viewVC = [[WGCTestViewController alloc] init];
    
    //tab 1
    WGCTableViewController *tableVC = [[WGCTestTableViewController alloc] init];
    
    //tab 2
    WGCRefreshTableViewController *refreshVC = [[WGCTestRefreshTableViewController alloc] init];
    
    NSArray *array = @[viewVC, tableVC, refreshVC];
    
    NSMutableArray *navi = [NSMutableArray array];
    
    for (UIViewController *vc in array) {
        UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [navi addObject:naviVC];
    }
    
    self.viewControllers = navi;
}

- (void)p_setupTabBarItems {
    NSArray *titles = @[@"viewVC", @"tableVC", @"refreshVC"];
    for (int i=0; i<self.tabBar.items.count; i++) {
        RDVTabBarItem *item = self.tabBar.items[i];
        item.title = titles[i];
        
        item.unselectedTitleAttributes = @{NSForegroundColorAttributeName:[UIColor greenColor], NSFontAttributeName:[UIFont systemFontOfSize:12]};
        item.selectedTitleAttributes = @{NSForegroundColorAttributeName:[UIColor purpleColor], NSFontAttributeName:[UIFont systemFontOfSize:18]};
    }
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
