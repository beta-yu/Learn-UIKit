//
//  ViewController.m
//  HTTPResearch
//
//  Created by qiyu on 2020/1/2.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

//A delightful networking framework for iOS, macOS, watchOS, and tvOS. http://afnetworking.com

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIButton *button;
@property (nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Send Request" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sendHTTPRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.button = button;
    
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    self.label = label;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat centerX = self.view.frame.size.width / 2;
    CGFloat centerY = self.view.frame.size.height / 2;
    
    self.button.frame = CGRectMake(0, 0, 200, 50);
    self.button.center = CGPointMake(centerX, centerY);
    
    self.label.frame = CGRectMake(0, 0, 100, 50);
    self.label.center = CGPointMake(centerX, centerY+100);
    self.label.textAlignment = NSTextAlignmentCenter;
}


- (void)sendHTTPRequest {
    NSString *URLString = @"http://www.kuaidi100.com/query?type=yuantong&postid=11111111111";
    NSURL *url = [NSURL URLWithString:URLString];
//    1.
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
////        Your completion handler needs to do three things:
////
////        Verify that the error parameter is nil. If not, a transport error has occurred; handle the error and exit.
////
////        Check the response parameter to verify that the status code indicates success and that the MIME type is an expected value. If not, handle the server error and exit.
////
////        Use the data instance as needed.
////        在与创建任务的队列不同的Grand Central Dispatch队列上调用完成该处理程序。
////        因此，任何使用数据或错误来更新UI的工作（例如更新webView）都应明确放置在主队列中。
//        if (data) {
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            if ([json isKindOfClass:[NSDictionary class]]) {
//                NSArray *arr = json[@"data"];
//                dispatch_sync(dispatch_get_main_queue(), ^{
//                   self.label.text = [arr firstObject][@"context"];
//                });
//            }
//        } else if (error) {
//            NSLog(@"%@", error);
//        }
//    }];
    
//    2.
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([json isKindOfClass:[NSDictionary class]]) {
                NSArray *arr = json[@"data"];
                dispatch_sync(dispatch_get_main_queue(), ^{
                    self.label.text = [arr firstObject][@"context"];
                });
            }
        } else if (error) {
            NSLog(@"%@", error);
        }
    }];
    [task resume];
}

@end
