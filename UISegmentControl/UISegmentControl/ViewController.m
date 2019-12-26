//
//  ViewController.m
//  UISegmentControl
//
//  Created by qiyu on 2019/11/27.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)control:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (IBAction)control:(id)sender {
    UISegmentedControl *sc = (UISegmentedControl *)sender;
    if (sc.selectedSegmentIndex == 0) {
        self.image.image = [UIImage imageNamed:@"camera.jpg"];
    } else {
        self.image.image = [UIImage imageNamed:@"white.jpg"];
    }
}
@end
