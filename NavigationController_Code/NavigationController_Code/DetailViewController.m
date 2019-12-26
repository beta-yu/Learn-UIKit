//
//  DetailViewController.m
//  NavigationController_Code
//
//  Created by qiyu on 2019/12/3.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"详情";
    [self setUpButton];
}

- (void)setUpButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:@"返回列表" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 50);
    button.center = self.view.center;
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked {
    UIViewController *goalVC = self.navigationController.childViewControllers[1]; //数组，索引从0开始，从root开始
    //返回到指定VC
    [self.navigationController popToViewController:goalVC animated:YES];
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
