//
//  CustomTabBarController.m
//  UITabBarController
//
//  Created by qiyu on 2019/12/4.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "CustomTabBarController.h"

@interface CustomTabBarController () <UITabBarControllerDelegate>

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
}

//选中了哪个VC，可以做的事更多
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    viewController.view.backgroundColor = [UIColor orangeColor];
}

@end
