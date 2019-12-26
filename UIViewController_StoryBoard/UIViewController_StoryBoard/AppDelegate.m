//
//  AppDelegate.m
//  UIViewController_StoryBoard
//
//  Created by qiyu on 2019/12/1.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "AppDelegate.h"
#import "XIBViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Xcode11创建新工程后增加了ScenceDelegate.h文件，文件结构发生变化
    //https://blog.csdn.net/a1034386099/article/details/102388716
    
    //1. 创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //2. 创建viewcontroller（3种方法）
    //(1)
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view.backgroundColor = [UIColor whiteColor];
    //(2)
    //2.1 找到storyboard
    //UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Me" bundle:nil];
    //2.2 通过唯一标识符在storyboard中找到VC
    //UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"abc"];
    //or使用箭头指向的那个VC
    //UIViewController *vc = [sb instantiateInitialViewController];
    //(3)
    //采用xib文件创建VC
    //XIBViewController *vc = [[XIBViewController alloc] initWithNibName:@"XIBViewController" bundle:nil];
    //or
    XIBViewController *vc = [[XIBViewController alloc] init]; //会自己去找Xib文件
    
    
    //3. 将vc与window关联
    self.window.rootViewController = vc;
    //4. 显示window
    [self.window makeKeyAndVisible]; //让window成为主窗口并显示出来
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
