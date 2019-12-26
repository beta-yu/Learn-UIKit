//
//  AppDelegate.m
//  NavigationController_Code
//
//  Created by qiyu on 2019/12/3.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"abc"];
    
    vc.navigationItem.title = @"首页";
    
    CustomNavigationController *naviVC = [[CustomNavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = naviVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
