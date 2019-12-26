//
//  ViewController.m
//  Model
//
//  Created by qiyu on 2019/11/29.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"
#import "NewsTableViewCell.h"
#import "News.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *news;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Controller获取数据
    self.news = [[[News alloc] init] getModels];
    
    self.tableView.rowHeight = 80.0;
    
    self.tableView.tableFooterView = [[UIView alloc] init]; //可以覆盖掉tableView下面多余的行
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewsTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    //Controller配置View
    [tableViewCell configCell:self.news[indexPath.row]];
    
    return tableViewCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.news.count;
}



@end
