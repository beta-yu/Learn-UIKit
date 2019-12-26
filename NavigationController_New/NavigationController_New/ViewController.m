//
//  ViewController.m
//  NavigationController_New
//
//  Created by qiyu on 2019/12/4.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //API_AVAILABLE(ios(8.0))
    
    //self.navigationController.hidesBarsOnTap = YES; //点击屏幕导航条隐藏，再次点击后出现
    
//    self.navigationController.hidesBarsOnSwipe = YES; //滑动屏幕隐藏导航栏
    
//    self.navigationController.hidesBarsWhenKeyboardAppears = YES;
    
    self.navigationController.hidesBarsWhenVerticallyCompact = YES; //旋转屏幕导航条隐藏
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES]; //可收回键盘
}


@end
