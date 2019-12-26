//
//  ViewController.m
//  NavigationController
//
//  Created by qiyu on 2019/12/2.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationItem.title = @"首页";
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Ice cream"]];
    self.navigationItem.titleView = view;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"abc"];
    
    //栈结构
    //压栈
    [self.navigationController pushViewController:vc animated:YES];
}


@end
