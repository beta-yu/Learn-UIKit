//
//  RootTabBarController.m
//  WeChat_Code
//
//  Created by qiyu on 2019/12/4.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "RootTabBarController.h"
#import "ViewController_1.h"
#import "ViewController_2.h"
#import "ViewController_3.h"
#import "ViewController_4.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *titles = @[@"Favorites", @"Contacts", @"Recents", @"More"];
    NSInteger tabBarItems[] = {UITabBarSystemItemFavorites, UITabBarSystemItemContacts, UITabBarSystemItemRecents, UITabBarSystemItemMore};
    
    for (int i = 0; i < 4; ++i) {
        [self addChildWithVCName:[NSString stringWithFormat:@"ViewController_%d", i+1] navigationItemTitle:titles[i] item:tabBarItems[i]];
    }
}


- (void)addChildWithVCName:(NSString *)vcName navigationItemTitle:(NSString *)title item:(UITabBarSystemItem)item {
    //1.创建控制器
    Class class = NSClassFromString(vcName);
    UIViewController *vc = [[class alloc] init];
    
    //2.设置属性
    vc.navigationItem.title = title;
    UIBarButtonItem *vcRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    vc.navigationItem.rightBarButtonItem = vcRight;
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:item tag:0];
    vc.tabBarItem = tabBarItem;
    
    //3.创建导航控制器
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    //4.添加至标签栏控制器
    [self addChildViewController:nc];
}

//TabBarController --> NavigationController --> ViewController

@end
