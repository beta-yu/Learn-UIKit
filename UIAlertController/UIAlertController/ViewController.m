//
//  ViewController.m
//  UIAlertController
//
//  Created by qiyu on 2019/12/1.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)showAlert:(id)sender;
- (IBAction)showSheet:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)showAlert:(id)sender {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"天气变冷，注意防寒！" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Clicked OK!");
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Clicked cancel!");
    }];
    
    [ac addAction:ok];
    [ac addAction:cancel];
    
    [self presentViewController:ac animated:YES completion:nil];
}

- (IBAction)showSheet:(id)sender {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"设置图像" message:@"选择方式" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *one = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *two = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *three = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [actionSheet addAction:one];
    [actionSheet addAction:two];
    [actionSheet addAction:three];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}
@end
