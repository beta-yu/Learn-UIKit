//
//  SecondViewController.m
//  ControllerBackPassValue
//
//  Created by qiyu on 2019/12/2.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
- (IBAction)submit:(id)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submit:(id)sender {
    //3.传值
    [self.delegate passValue:self.textFiled.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
