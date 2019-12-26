//
//  ViewController.m
//  UITableView_Index
//
//  Created by qiyu on 2019/11/29.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *sectionName;
@property (strong, nonatomic) NSMutableArray<NSMutableArray *> *lableText;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


//通过重写数据属性的get方法实现懒加载（延迟加载），将数据加载从viewDidLoad加载延迟到使用数据时
- (NSArray *)lableText {
    if (_lableText == nil) {
        NSArray *tempArray = @[@[@"Abc", @"Acb"], @[@"Bac", @"Bca"], @[@"Cab", @"Cba"], @[@"Dab", @"Dba", @"Dac"], @[@"Eab", @"Eba", @"Ecb", @"Eda"]];
        _lableText = [NSMutableArray arrayWithArray:tempArray];
    }
    return _lableText;
}

- (NSArray *)sectionName {
    if (_sectionName == nil) {
        _sectionName = @[@"A", @"B", @"C", @"D", @"E"];
    }
    return _sectionName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //右侧索引文字的颜色
    self.tableView.sectionIndexColor = UIColor.blackColor;
    //索引区域背景色
    self.tableView.sectionIndexBackgroundColor = UIColor.grayColor;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionName.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lableText[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
    }
    cell.textLabel.text = self.lableText[indexPath.section][indexPath.row];
    return cell;
}

//返回section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionName[section];
}

//返回右侧索引title数组
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.sectionName;
}

//如果需要在点击索引时做一些事情可以实现该方法
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    NSLog(@"您点击了索引%@", title);
    return index; //该方法必须返回index，否则索引将失效
}

@end
