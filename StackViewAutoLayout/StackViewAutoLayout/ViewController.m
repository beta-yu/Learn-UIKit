//
//  ViewController.m
//  StackViewAutoLayout
//
//  Created by qiyu on 2020/1/8.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (nonatomic) UILabel *label;
//@property (nonatomic) UIImageView *imageView;
//@property (nonatomic) UIButton *button;
//@property (nonatomic) UIStackView *stackView;

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;

@end

@implementation ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"Flowers";
//    label.textAlignment = NSTextAlignmentCenter;
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flower"]];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    UIButton *button = [[UIButton alloc] init];
//    [button setTitle:@"Edit" forState:UIControlStateNormal];
//    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[label, imageView, button]];
//    stackView.axis = UILayoutConstraintAxisVertical;
//    stackView.alignment = UIStackViewAlignmentCenter;
//    stackView.distribution = UIStackViewDistributionEqualSpacing;
//    stackView.spacing = 8.0;
//    [self.view addSubview:stackView];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configRedView];
    [self configBlueView];
    [self configYellowView];
    NSLog(@"%s", __func__);
}

- (void)configRedView {
    UIView *superView = self.view;
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:redView];
    
    //约束1：相对superView左边缘间距20
    NSLayoutConstraint *redLeftLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    //只有在没有参照控件的情况下，约束才能添加到自身，否则添加到父控件
    [superView addConstraint:redLeftLc];
    //约束2：相对superView底边缘间距20
    NSLayoutConstraint *redBottomLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:-20];
    [superView addConstraint:redBottomLc];
    //约束3：设置自身宽为superview的一半
    //NSLayoutConstraint *redWidthLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    
    //直接设置自身宽度
    NSLayoutConstraint *redWidthLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0 constant:100];
    //无参照控件，约束添加到自身
    [redView addConstraint:redWidthLc];
    //直接设置自身高度
    NSLayoutConstraint *redHeightLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0 constant:100];
    [redView addConstraint:redHeightLc];
    self.redView = redView;
}

- (void)configBlueView {
    UIView *superView = self.view;
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:blueView];
    
//  带Margin为外边缘，不带为内边缘，两者之间的距离为Margin大小
    NSLayoutConstraint *blueLeft = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeRight multiplier:1.0 constant:20];
    NSLayoutConstraint *blueBottom = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0];
    NSLayoutConstraint *blueWidth = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    NSLayoutConstraint *blueHeight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [superView addConstraints:@[blueLeft, blueBottom, blueWidth, blueHeight]];
    self.blueView = blueView;
}

- (void)configYellowView {
    UIView *superView = self.view;
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:yellowView];
     
    NSLayoutConstraint *yellowLeft = [NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:20];
    NSLayoutConstraint *yellowBottom = [NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0];
    NSLayoutConstraint *yellowWidth = [NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    NSLayoutConstraint *yellowHeight = [NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *yellowAnotherLeft = [NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeRight multiplier:1.0 constant:20];
    yellowAnotherLeft.priority = 250; //设置优先级，默认为1000
    //约束yellowAnotherLeft的优先级低于yellowLeft，两个都是约束yellowView的left，因此只有高优先级不存在时低优先级的才有效
    [superView addConstraints:@[yellowLeft, yellowBottom, yellowWidth, yellowHeight, yellowAnotherLeft]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //移除blueView，yellowLeft约束失效
    [self.blueView removeFromSuperview];
    //动画更新界面
    //Animate changes to one or more views using the specified duration.
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}


@end
