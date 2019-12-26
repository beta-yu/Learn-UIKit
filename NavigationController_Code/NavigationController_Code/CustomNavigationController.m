//
//  CustomNavigationController.m
//  NavigationController_Code
//
//  Created by qiyu on 2019/12/4.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

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

//重写
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //将backBarButton上的文字改为""
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [super pushViewController:viewController animated:animated];
}

@end
