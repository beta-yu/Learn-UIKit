//
//  ViewController.m
//  UITabBar_Code
//
//  Created by qiyu on 2019/12/4.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configTabBar];
    
    self.tabBar.delegate = self;
}

- (void)configTabBar {
    self.tabBar.items[0].badgeValue = @"99";
    
    self.tabBar.selectedItem = self.tabBar.items[0];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"%@", item.badgeValue);
    
    item.badgeValue = nil; //清除角标
}


@end
