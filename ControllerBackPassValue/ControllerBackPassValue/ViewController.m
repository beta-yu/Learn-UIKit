//
//  ViewController.m
//  ControllerBackPassValue
//
//  Created by qiyu on 2019/12/2.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <PassValueProtocol>
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"abc"];
    //2.让当前控制器成为代理
    vc.delegate = self;
    //跳转
    [self presentViewController:vc animated:YES completion:nil];
}

//1.遵守协议，实现方法
- (void)passValue:(NSString * _Nullable)info {
    self.textLabel.text = info;
}



@end
