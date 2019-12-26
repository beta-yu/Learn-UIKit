//
//  ViewController.m
//  SIgn in and register
//
//  Created by qiyu on 2019/11/27.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)signin:(id)sender;
- (IBAction)signup:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)signin:(id)sender {
    //点击登录退回键盘
    [self.password resignFirstResponder];
    
    NSString *name = self.username.text;
    NSString *pwd = self.password.text;
    
    //if ...
    
}

- (IBAction)signup:(id)sender {
}


@end
