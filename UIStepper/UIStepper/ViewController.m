//
//  ViewController.m
//  UIStepper
//
//  Created by qiyu on 2019/11/27.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)change:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)change:(id)sender {
    UIStepper *stepper = (UIStepper *)sender;
    double count = stepper.value;
    
    self.label.text = [NSString stringWithFormat:@"您购买了%d件商品", (int)count];
}
@end
