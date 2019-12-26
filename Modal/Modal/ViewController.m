//
//  ViewController.m
//  Modal
//
//  Created by qiyu on 2019/12/1.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"
#import "OrangeViewController.h"

@interface ViewController ()
- (IBAction)moveToOrangeVC:(id)sender;
- (IBAction)segueMoveToOrangeVC:(id)sender;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)moveToOrangeVC:(id)sender {
    
    //创建要跳转到的VC，在storyboard中根据Identifier查找
    OrangeViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"abc"];
    
    vc.passedValue = @"Passed value from page1.";
    
    //跳转
    [self presentViewController:vc animated:YES completion:nil];
    
}

//完成使用segue时真正的传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    OrangeViewController *vc = [segue destinationViewController];
    vc.passedValue = @"Passed value from page1 by segue.";
}

- (IBAction)segueMoveToOrangeVC:(id)sender {
    //使用storyboard中的连线
    [self performSegueWithIdentifier:@"abcd" sender:nil];
}


//直接跳转是在storyboard中将button与VC直接连接做的，使用场景有限，因为不能通过代码来过滤跳转的条件


@end
