//
//  ViewController.m
//  HelloiOS
//
//  Created by qiyu on 2019/11/25.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//- (IBAction)button:(id)sender;
- (IBAction)textChange:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *username;

@end

@implementation ViewController

//UIView被UIViewController加载到内存中时会调用该方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor cyanColor];
//
//    UIView *view = [[UIView alloc] init];
//    view.frame = CGRectMake(100, 100, 100, 100);
//    view.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:view];
    
//    UIView *view2 = [self.view viewWithTag:100]; //使用tag获取view(storyboard中的)
//    view2.backgroundColor = [UIColor blackColor];
//
//    view.center = self.view.center; //view的中心点与父视图的中心点重合
//
//    self.view3.backgroundColor = [UIColor blueColor];
    //CGPoint 点
    //CGPointMake(<#CGFloat x#>, <#CGFloat y#>);
    //CGSize 宽高 （width, height)
    //CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
    
    //矩形有左上角点坐标和宽和高确定
    //CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
//    //UILabel
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    label.text = @"Hello iOS UILabel\nHello iOS UILabel\nHello iOS UILabel"; //\n
//    label.font = [UIFont systemFontOfSize:20];
//    label.textColor = [UIColor orangeColor];
//    label.numberOfLines = 0; //表示允许有多行显示
//    [self.view addSubview:label];
    
//    UITextField
//      clearbutton
//      Keyboard Type
//    UITextField
    
}

//UIView即将显示出来
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

//UIView显示出来
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

//渲染布局子控件
-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

//完成子控件的布局
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

//UIView即将消失时
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

//UIView完全消失
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

//- (IBAction)button:(id)sender {
//    self.view3.backgroundColor = [UIColor purpleColor];
//}

//监听用户输入
- (IBAction)textChange:(id)sender {
    UITextField *tf = (UITextField *)sender;
    NSLog(@"%@", tf.text);
}

//触摸UIView就会调用该方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //TODO：触摸空白出结束编辑，收回键盘
    
    //[self.view endEditing:YES];
    //or
    [self.username resignFirstResponder]; //失去第一响应者
}
@end
