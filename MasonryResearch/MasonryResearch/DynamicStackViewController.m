//
//  DynamicStackViewController.m
//  MasonryResearch
//
//  Created by qiyu on 2020/1/10.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "DynamicStackViewController.h"

@interface DynamicStackViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation DynamicStackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIEdgeInsets insets = UIEdgeInsetsMake(20.0, 0, 0, 0);
    self.scrollView.contentInset = insets;
    self.scrollView.scrollIndicatorInsets = insets;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
