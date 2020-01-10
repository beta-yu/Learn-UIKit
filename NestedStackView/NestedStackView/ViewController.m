//
//  ViewController.m
//  NestedStackView
//
//  Created by qiyu on 2020/1/8.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIStackView *rootStackView;
@property (nonatomic, strong) UIStackView *nameRowsStackView;
//@property (nonatomic, strong) UIStackView *firstNameStackView;
//@property (nonatomic, strong) UIStackView *middleNameStackView;
//@property (nonatomic, strong) UIStackView *lastNameStackView;
@property (nonatomic, strong) UIStackView *upperStackView;
@property (nonatomic, strong) UIStackView *buttonStackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configRootStackView];
}

- (void)configRootStackView {
    UIView *superView = self.view;
    UIStackView *rootStackView = [[UIStackView alloc] init];
    self.rootStackView = rootStackView;
    rootStackView.translatesAutoresizingMaskIntoConstraints = NO;
    rootStackView.axis = UILayoutConstraintAxisVertical;
    rootStackView.spacing = 8.0;
    [superView addSubview:rootStackView];
    
    UILayoutGuide *safeLayoutGuide = [superView safeAreaLayoutGuide];
    NSLayoutConstraint *rootStackViewTop = [rootStackView.topAnchor constraintEqualToAnchor:safeLayoutGuide.topAnchor];
    NSLayoutConstraint *rootStackViewBottom = [rootStackView.bottomAnchor constraintEqualToAnchor:safeLayoutGuide.bottomAnchor];
    NSLayoutConstraint *rootStackViewLeading = [rootStackView.leadingAnchor constraintEqualToAnchor:safeLayoutGuide.leadingAnchor constant:20.0];
    NSLayoutConstraint *rootStackViewTrailing = [rootStackView.trailingAnchor constraintEqualToAnchor:safeLayoutGuide.trailingAnchor constant:-20.0];
    [NSLayoutConstraint activateConstraints:@[rootStackViewTop, rootStackViewBottom, rootStackViewLeading, rootStackViewTrailing]];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    textView.backgroundColor = [UIColor grayColor];
    textView.text = @"Note:";
    //...
    [self configUpperStackView];
    [self configButtonStackView];
    [self.rootStackView addArrangedSubview:self.upperStackView];
    [self.rootStackView addArrangedSubview:textView];
    [self.rootStackView addArrangedSubview:self.buttonStackView];
    
//    [textView setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisHorizontal];
    [textView setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisVertical];
//    [textView setContentCompressionResistancePriority:250 forAxis:UILayoutConstraintAxisHorizontal];
//    [textView setContentCompressionResistancePriority:250 forAxis:UILayoutConstraintAxisVertical];
}

- (void)initNameStackView:(UIStackView *)stackView withIndex:(NSInteger)index {
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.spacing = 8.0;
    stackView.alignment = UIStackViewAlignmentFirstBaseline;
    stackView.distribution = UIStackViewDistributionFill;
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    static NSString *stringArray[] = {@"First", @"Second", @"Third"};
    label.text = stringArray[index];
    label.textAlignment = NSTextAlignmentLeft;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"Enter Name";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    [stackView addArrangedSubview:label];
    [stackView addArrangedSubview:textField];
    
    [label setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    [label setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisVertical];
//    [label setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisHorizontal];
//    [label setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisVertical];
    
    [textField setContentHuggingPriority:48 forAxis:UILayoutConstraintAxisHorizontal];
//    [textField setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisVertical];
    [textField setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisHorizontal];
//    [textField setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisVertical];
}

- (void)configNameRowsStackView {
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.spacing = 8.0;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.distribution = UIStackViewDistributionFill;
    self.nameRowsStackView = stackView;
    
    UIStackView *firstNameStackView = [[UIStackView alloc] init];
    [self initNameStackView:firstNameStackView withIndex:0];
    [self.nameRowsStackView addSubview:firstNameStackView];
    UITextField *firstTextField = firstNameStackView.subviews.lastObject;
    
    UIStackView *middleNameStackView = [[UIStackView alloc] init];
    [self initNameStackView:middleNameStackView withIndex:1];
    [self.nameRowsStackView addSubview:middleNameStackView];
    UITextField *middleTextField = middleNameStackView.subviews.lastObject;
    
    
    UIStackView *lastNameStackView = [[UIStackView alloc] init];
    [self initNameStackView:lastNameStackView withIndex:2];
    [self.nameRowsStackView addSubview:lastNameStackView];
    UITextField *lastTextField = lastNameStackView.subviews.lastObject;
    
    [self.nameRowsStackView addArrangedSubview:firstNameStackView];
    [self.nameRowsStackView addArrangedSubview:middleNameStackView];
    [self.nameRowsStackView addArrangedSubview:lastNameStackView];
    
    NSLayoutConstraint *middleNameWidthLC = [middleTextField.widthAnchor constraintEqualToAnchor:[firstTextField safeAreaLayoutGuide].widthAnchor];
    NSLayoutConstraint *lastNameWidthLC = [lastTextField.widthAnchor constraintEqualToAnchor:[firstTextField safeAreaLayoutGuide].widthAnchor];
    [NSLayoutConstraint activateConstraints:@[middleNameWidthLC, lastNameWidthLC]];
}

- (void)configUpperStackView {
    UIStackView *upperStackView = [[UIStackView alloc] init];
    upperStackView.translatesAutoresizingMaskIntoConstraints = NO;
    upperStackView.axis = UILayoutConstraintAxisHorizontal;
    upperStackView.spacing = 8.0;
    upperStackView.alignment = UIStackViewAlignmentFill;
    upperStackView.distribution = UIStackViewDistributionFill;
    self.upperStackView = upperStackView;
    [self configNameRowsStackView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1"]];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.contentMode = UIViewContentModeScaleToFill;
    [upperStackView addArrangedSubview:imageView];
    [upperStackView addArrangedSubview:self.nameRowsStackView];
    
    NSLayoutConstraint *imageViewLayoutHeight = [imageView.heightAnchor constraintEqualToAnchor:[self.nameRowsStackView safeAreaLayoutGuide].heightAnchor];
    imageViewLayoutHeight.active = YES;
    UILayoutGuide *imageViewLayoutGuide = [imageView safeAreaLayoutGuide];
    NSLayoutConstraint *imageViewWidth = [imageView.widthAnchor constraintEqualToAnchor:imageViewLayoutGuide.heightAnchor];
    imageViewWidth.active = YES;
//    [imageView setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisHorizontal];
//    [imageView setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisVertical];
    [imageView setContentCompressionResistancePriority:48 forAxis:UILayoutConstraintAxisHorizontal];
    [imageView setContentCompressionResistancePriority:48 forAxis:UILayoutConstraintAxisVertical];
}

- (void)configButtonStackView {
    UIStackView *buttonStackView = [[UIStackView alloc] init];
    buttonStackView.axis = UILayoutConstraintAxisHorizontal;
    buttonStackView.translatesAutoresizingMaskIntoConstraints = NO;
    buttonStackView.spacing = 8.0;
    buttonStackView.alignment = UIStackViewAlignmentFirstBaseline;
    buttonStackView.distribution = UIStackViewDistributionFillEqually;
    self.buttonStackView = buttonStackView;
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    saveButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    clearButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [buttonStackView addArrangedSubview:saveButton];
    [buttonStackView addArrangedSubview:cancelButton];
    [buttonStackView addArrangedSubview:clearButton];
}


@end
