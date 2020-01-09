//
//  ViewController1.m
//  StackViewAutoLayout
//
//  Created by qiyu on 2020/1/9.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configStackView];
}

- (void)configStackView {
    UIView *superView = self.view;
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Flowers";
    label.translatesAutoresizingMaskIntoConstraints = NO;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flower"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Edit" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[label, imageView, button]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.spacing = 8.0;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:stackView];
    
    UILayoutGuide *safeAreaGuide = superView.safeAreaLayoutGuide;
    NSLayoutConstraint *stackViewLeading = [stackView.leadingAnchor constraintEqualToAnchor:safeAreaGuide.leadingAnchor constant:0];
    NSLayoutConstraint *stackViewTrailing = [stackView.trailingAnchor constraintEqualToAnchor:safeAreaGuide.trailingAnchor constant:0];
    NSLayoutConstraint *stackViewTop = [stackView.topAnchor constraintEqualToAnchor:safeAreaGuide.topAnchor];
    NSLayoutConstraint *stackViewBottom = [stackView.bottomAnchor constraintEqualToAnchor:safeAreaGuide.bottomAnchor];
    [NSLayoutConstraint activateConstraints:@[stackViewLeading, stackViewTrailing, stackViewTop, stackViewBottom]];
    
    //CHCR Priority
    [imageView setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisHorizontal];
    [imageView setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisVertical];
    [imageView setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisHorizontal];
    [imageView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisVertical];
    
//    NSLayoutConstraint *imageViewTop = [imageView.topAnchor constraintGreaterThanOrEqualToAnchor:label.bottomAnchor];
//    NSLayoutConstraint *imageViewBottom = [imageView.bottomAnchor constraintLessThanOrEqualToAnchor:button.topAnchor];
//    [NSLayoutConstraint activateConstraints:@[imageViewTop, imageViewBottom]];
    
    [stackView addArrangedSubview:label];
    [stackView addArrangedSubview:imageView];
    [stackView addArrangedSubview:button];
}

@end
