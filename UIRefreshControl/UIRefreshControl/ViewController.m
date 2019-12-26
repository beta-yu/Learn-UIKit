//
//  ViewController.m
//  UIRefreshControl
//
//  Created by qiyu on 2019/11/29.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUIRefreshControl];
}

- (void)setupUIRefreshControl {
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    refreshControl.tintColor = [UIColor blueColor];
    
    self.tableView.refreshControl = refreshControl;
}

//在中有更具体实现刷新功能


@end
