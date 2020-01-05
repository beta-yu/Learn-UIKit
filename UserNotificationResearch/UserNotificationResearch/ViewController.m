//
//  ViewController.m
//  UserNotificationResearch
//
//  Created by qiyu on 2020/1/2.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    self.label = label;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat centerX = self.view.frame.size.width / 2;
    CGFloat centerY = self.view.frame.size.height / 2;
    self.label.frame = CGRectMake(0, 0, 150, 50);
    self.label.center = CGPointMake(centerX, centerY);
    self.label.textAlignment = NSTextAlignmentCenter;
}



@end
