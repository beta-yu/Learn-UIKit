//
//  ViewController.m
//  UIDatePicker
//
//  Created by qiyu on 2019/11/27.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)getDate:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *inputDate;

@property (strong, nonatomic) UIDatePicker *picker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.创建日期选择器
    self.picker = [[UIDatePicker alloc] init];
    self.picker.datePickerMode = UIDatePickerModeDate;
    // 通过设置区域来更改键盘样式
    self.picker.locale = [NSLocale localeWithLocaleIdentifier:@"ZH_cn"];
    
    // 2.设置输入框的输入方式为日期选择器
    self.inputDate.inputView = self.picker;
    
    // 3.监听选择的日期
    //  为picker添加响应事件，由self的getBirth:方法处理事件
    [self.picker addTarget:self action:@selector(getBirth:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)getBirth:(UIDatePicker *)picker {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    self.inputDate.text = [dateFormatter stringFromDate:picker.date];
}


- (IBAction)getDate:(id)sender {
    UIDatePicker *picker = (UIDatePicker *)sender;
    
    //格式化
    NSDateFormatter *dataFormatrer = [[NSDateFormatter alloc] init];
    //yyyy MM dd hh(12小时制) HH(24小时制) mm ss
    [dataFormatrer setDateFormat:@"yyyy年MM月dd日"];
    self.label.text = [dataFormatrer stringFromDate:picker.date];
}

// 为了退键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
