//
//  ViewController.m
//  UITextView
//
//  Created by qiyu on 2019/11/27.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textview;
- (IBAction)submit:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)submit:(id)sender {
    NSLog(@"%@", self.textview.text);
}
@end
