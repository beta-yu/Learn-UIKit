//
//  AppDelegate.m
//  StackViewAutoLayout
//
//  Created by qiyu on 2020/1/8.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController1.h"

@interface AppDelegate ()

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    ViewController *viewController = [[ViewController alloc] init];
//    viewController.view.backgroundColor = [UIColor whiteColor];
    ViewController1 *viewController1 = [[ViewController1 alloc] init];
    viewController1.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = viewController1;
    [self.window makeKeyAndVisible];
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
