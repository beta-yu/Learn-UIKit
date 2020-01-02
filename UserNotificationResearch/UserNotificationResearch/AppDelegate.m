//
//  AppDelegate.m
//  UserNotificationResearch
//
//  Created by qiyu on 2020/1/2.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // To request authorization
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionAlert | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        // If your app is authorized for all of the requested interaction types,
        // the system calls your completion handler block with the granted parameter set to YES.
        // If one or more interaction type is disallowed, the parameter is NO.
        if (granted && !error) {
            NSLog(@"request authorization succeeded!");
        }
    }];
    
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        NSLog(@"%@", settings);
    }];
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"Introduction to notification";
    content.subtitle = @"Session01";
    content.body = @"These new notifications look amazing!";
    content.badge = @1;
    
    //60s后提醒
    UNTimeIntervalNotificationTrigger *trigger1 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:60 repeats:NO];
    
    NSString *requestIdentifier = @"simpleIdentfier";
    UNNotificationRequest *requset = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:trigger1];
    
    [center addNotificationRequest:requset withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
    
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
