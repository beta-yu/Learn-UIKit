//
//  AppDelegate.m
//  UserNotificationResearch
//
//  Created by qiyu on 2020/1/2.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // To request authorization
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    //After implementing these methods in an object, assign that object to the delegate property of the shared UNUserNotificationCenter object.
    center.delegate = self;
    [self requestNotificationAuthorizationWithNotificationCenter:center];
    
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        NSLog(@"%@", settings);
    }];
    
    [self configLocalNotification1WithNotificationCenter:center];
    [self configLocalNotification2WithNotificationCenter:center];
//    删除计划的推送
//    [center removePendingNotificationRequestsWithIdentifiers:<#(nonnull NSArray<NSString *> *)#>];
    
//  call the registerForRemoteNotifications method of UIApplication to request the device token.
    [application registerForRemoteNotifications];
//  Upon successful registration, you receive the token in your app delegate’s application:didRegisterForRemoteNotificationsWithDeviceToken: method.
//  In addition to handling successful registrations with APNs, be prepared to handle unsuccessful registrations by implementing the application:didFailToRegisterForRemoteNotificationsWithError: method.
   
    return YES;
}

- (void)requestNotificationAuthorizationWithNotificationCenter:(UNUserNotificationCenter *)center {
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionAlert | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        // If your app is authorized for all of the requested interaction types,
        // the system calls your completion handler block with the granted parameter set to YES.
        // If one or more interaction type is disallowed, the parameter is NO.
        if (granted && !error) {
            NSLog(@"request authorization succeeded!");
        }
    }];
}

- (void)configLocalNotification1WithNotificationCenter:(UNUserNotificationCenter *)center {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"Introduction to notification";
    content.subtitle = @"Session01";
    content.body = @"These new notifications look amazing!";
    content.badge = @1;
    content.categoryIdentifier = @"MESSAGE"; //使用该id匹配category
    
    //10s后触发
    UNTimeIntervalNotificationTrigger *trigger1 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10 repeats:NO];
    
    NSString *requestIdentifier = @"simpleIdentfier";
    UNNotificationRequest *requset = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:trigger1];
    
    [center addNotificationRequest:requset withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
}

- (void)configLocalNotification2WithNotificationCenter:(UNUserNotificationCenter *)center {
    UNNotificationAction *action =  [UNNotificationAction actionWithIdentifier:@"REPLY" title:@"Reply" options:UNNotificationActionOptionNone];
    UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"MESSAGE"
                                                                              actions:@[action]
                                                                    intentIdentifiers:@[]
                                                                              options:UNNotificationCategoryOptionNone];
    [center setNotificationCategories:[NSSet setWithArray:@[category]]];
}




#pragma mark - UNUserNotificationCenterDelegate

// Handle Notifications While Your App Runs in the Foreground
// 可根据推送内容更新UI
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
    //忽略Badge
}

// Handle User-Selected Actions
// If you do not implement this method, your app never responds to custom actions.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    if ([response.notification.request.content.categoryIdentifier isEqual:@"MESSAGE"]) {
        if ([response.actionIdentifier isEqual:@"REPLY"]) {
            //处理action
            NSLog(@"User selected reply action.");
        } else if ([response isEqual:UNNotificationDefaultActionIdentifier]
                   || [response isEqual:UNNotificationDismissActionIdentifier]) {
            
        }
        // The action identifier that the user chose:
        // * UNNotificationDismissActionIdentifier if the user dismissed the notification
        // * UNNotificationDefaultActionIdentifier if the user opened the application from the notification
        // * the identifier for a registered UNNotificationAction for other actions
        
        //At the end of your implementation, call the completionHandler block to let the system know that you are done processing the user's response.
        completionHandler();
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //Upon successful registration, rorward Tokens to Your Provider Server.
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Try again later.
}


@end
