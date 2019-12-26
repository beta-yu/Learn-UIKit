//
//  ViewController.m
//  UIActivityIndicatorView
//
//  Created by qiyu on 2019/11/27.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity2;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //延时3秒执行
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.activity stopAnimating];
//        [self.activity2 startAnimating];
//    });
    
    //UIView动画
    [UIView animateWithDuration:3.0 animations:^{
        //动画进行到1.0，是否有动画：YES
        [self.progress setProgress:1.0 animated:YES];
    }];
    
}


@end
