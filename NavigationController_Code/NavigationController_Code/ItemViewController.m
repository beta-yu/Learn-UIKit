//
//  ItemViewController.m
//  NavigationController_Code
//
//  Created by qiyu on 2019/12/3.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ItemViewController.h"
#import "DetailViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"项目";
    [self setUpButton];
    [self setUpRightBarButtonItem];
}

- (void)setUpRightBarButtonItem {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"详情" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    
    self.navigationItem.rightBarButtonItem = right;
}

- (void)rightClick {
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)setUpButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:@"返回首页" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 50);
    button.center = self.view.center;
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
