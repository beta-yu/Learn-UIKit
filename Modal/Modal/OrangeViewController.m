//
//  OrangeViewController.m
//  Modal
//
//  Created by qiyu on 2019/12/1.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "OrangeViewController.h"

@interface OrangeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation OrangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.infoLabel.text = self.passedValue;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//  触摸就会调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
