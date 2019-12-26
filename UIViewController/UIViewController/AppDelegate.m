//
//  AppDelegate.m
//  UIViewController
//
//  Created by qiyu on 2019/12/1.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //删除storyboard中的箭头后，需手动完成以下一系列工作
    
    //1. 创建一个UIWindow，大小与屏幕相同
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //2. 创建一个控制器
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    //3. 将window与controller关联起来
    self.window.rootViewController = vc;
    //4. 将window显示出来
    [self.window makeKeyAndVisible]; //让window成为主窗口并且显示出来
    
    //我的一执行就crash，好像是因为Xcode版本不同创建的工程不同
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
