//
//  ViewController.m
//  ControllerBackPassValue_Block
//
//  Created by qiyu on 2019/12/2.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //监听通知，设置处理方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlerNotification:) name:@"abc" object:nil];
}

- (void)handlerNotification:(NSNotification *)notification {
    //获得通知内容
    self.label.text = notification.userInfo[@"info"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"abc"];
    
    
    
    [self presentViewController:vc animated:YES completion:nil];
}


@end
