//
//  ViewController.m
//  UIPickerView
//
//  Created by qiyu on 2019/11/27.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate> //实现协议
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *firstCol;
@property (weak, nonatomic) IBOutlet UILabel *secondCol;
@property (strong, nonatomic) NSArray *firstArray;
@property (strong, nonatomic) NSArray *secondArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.firstArray = @[@"中国", @"俄罗斯", @"加拿大", @"美国", @"日本"];
    self.secondArray = @[@"A", @"B", @"C", @"D", @"E"];
    
    //设置依赖
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
}

#pragma mark - UIPickerViewDataSource

//选择器有几列
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 2;
}

//每一列有多少行
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.firstArray.count;
    } else {
        return self.secondArray.count;
    }
}


#pragma mark - UIPickerViewDelegate
//某行某列的标题
//会被多次调用，每次调用返回一个标题 view获得数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return self.firstArray[row];
    } else {
        return self.secondArray[row];
    }
    
}


//选中哪一列的哪一行数据 view返回数据
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.firstCol.text = self.firstArray[row];
    } else {
        self.secondCol.text = self.secondArray[row];
    }
}

@end
