//
//  ListViewController.m
//  NavigationController_Code
//
//  Created by qiyu on 2019/12/3.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ListViewController.h"
#import "ItemViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"列表";
    [self setUPRightBarButtonIter];
}

- (void)setUPRightBarButtonIter {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"项目" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)rightClick {
    ItemViewController *itemVC = [[ItemViewController alloc] init];
    
    [self.navigationController pushViewController:itemVC animated:YES];
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
