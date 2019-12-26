//
//  ViewController.m
//  UIImageView
//
//  Created by qiyu on 2019/11/27.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UITableView *tableView;
@property (nonatomic) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTableView];
    [self setImageView];
}

- (void)setTableView {
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = self.view.bounds;
    self.tableView.backgroundColor = [UIColor orangeColor];
    self.tableView.separatorInset = UIEdgeInsetsMake(11, 11, 20, 11);
    [self.view addSubview:self.tableView];
    
}

- (void)setImageView {
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera.jpg"]];
    CGRect tempframe;
    tempframe.size = CGSizeMake(354, 256);
    self.imageView.frame = tempframe; //不能直接修改frame的size，不能修改OC结构体属性的成员
    self.imageView.center = self.tableView.center;
    [self.tableView addSubview:self.imageView];
}

//这个什么用
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


@end
