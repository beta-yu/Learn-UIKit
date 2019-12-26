//
//  ViewController.m
//  NavigationController_Code
//
//  Created by qiyu on 2019/12/3.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUPRightBarButtomItem];
}

- (void)setUPRightBarButtomItem {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"列表" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)rightClick {
    
    ListViewController *listVC = [[ListViewController alloc] init];
    
    [self.navigationController pushViewController:listVC animated:YES];
}


@end
