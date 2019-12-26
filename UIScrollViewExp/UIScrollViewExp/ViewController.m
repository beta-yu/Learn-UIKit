//
//  ViewController.m
//  UIScrollViewExp
//
//  Created by qiyu on 2019/11/28.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setScrollView];
}

- (void)setScrollView {
    self.scrollView.contentSize = CGSizeMake(0, 2000);
}


@end
