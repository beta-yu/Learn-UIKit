//
//  ViewController.m
//  UITableView
//
//  Created by qiyu on 2019/11/28.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabelView;
- (IBAction)edit:(id)sender;
- (IBAction)finish:(id)sender;



@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    
    NSArray *one = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15"];
    
    self.data = [NSMutableArray arrayWithArray:one];
    
    [self setupUIRefreshControl];
}

- (void)setupUIRefreshControl {
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    refreshControl.tintColor = [UIColor blueColor];
    
    //为refreshControl绑定事件响应方法
    [refreshControl addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    
    self.tabelView.refreshControl = refreshControl;
}

- (void)refreshTableView {
    //刷新操作延时两秒，模拟网络请求延时
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.data insertObject:@"new" atIndex:0];
        [self.tabelView reloadData];
        
        if ([self.tabelView.refreshControl isRefreshing]) {
            [self.tabelView.refreshControl endRefreshing]; //结束刷新状态
        }
    });
}

#pragma mark - UITableViewDataSource

//tabelView有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//每行显示的内容是什么
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //NSLog(@"%d", (int)indexPath.row);
    
    //从重用池中查找标识符为@“abc”的TableViewCell
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    //如果没找到，再创建一个
    if (tableViewCell == nil) {
        //设置单元格 initWithStyle:单元格样式 reuseIdentifier:重用标识符
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"abc"];
        
        NSLog(@"alloc");
    }
    
    //style : UITableViewCellStyleDefault/UITableViewCellStyleSubtitle/UITableViewCellStyleValue1/UITableViewCellStyleValue2(不会显示图片)
    
    tableViewCell.imageView.image = [UIImage imageNamed:@"img1"];
    tableViewCell.textLabel.text = self.data[indexPath.row];
    tableViewCell.detailTextLabel.text = @"这里是detailTextLabel";
    
    return tableViewCell;
}

//某一组有多少行
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"头部视图";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"底部视图";
}


#pragma mark - UITableViewDelegate

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}
//如果每一行行高相等，可用self.tableView.rowHeight直接设置，不使用上方法，性能更优，因为该方法会被调用多次

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40.0;
}

//可以自定义头部底部视图
// Section header & footer information. Views are preferred over title should you decide to provide both
//
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header height
//- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height

// Called after the user changes the selection.

//用户选择了哪一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *selData = self.data[indexPath.row];
//    NSLog(@"%@", selData);
}

//用户取消选择了哪一行
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


//删除

//1.该行能不能编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"canEditRowAtIndexPath");
    return YES;
}

//2. 提交编辑
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //判断编辑风格
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //先删除源数据，再在界面上删除
        
        //1. 删除数据源
        [self.data removeObjectAtIndex:indexPath.row];
        
        //2. 删除界面上的那一行
        // 删除indexPath那一行，删除动画UITableViewRowAnimationFade
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        //1.添加数据源
        [self.data insertObject:@"New" atIndex:indexPath.row];
        
        //2.在界面上增加
        // (1) 刷新整个表格，性能太差
        //[self.tabelView reloadData];
        // (2) 局部刷新
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

//3. 设置删除按钮的文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (IBAction)edit:(id)sender {
    //点击按钮tableView进入编辑状态
    [self.tabelView setEditing:YES];
}

- (IBAction)finish:(id)sender {
    [self.tabelView setEditing:NO];
}



//返回编辑风格
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    //默认情况是删除风格
    if ([self.tabelView isEditing]) {
        //增加时需自定义返回插入风格
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
    
}


//移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//从哪移动到哪
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    NSString *temp = self.data[sourceIndexPath.row];
    [self.data removeObjectAtIndex:sourceIndexPath.row];
    [self.data insertObject:temp atIndex:destinationIndexPath.row];
}

@end


//首先进入编辑状态，再添加/删除/移动
