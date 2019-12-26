//
//  ViewController.m
//  UIScrollViewExp2
//
//  Created by qiyu on 2019/11/28.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addImageView];
    
    self.scrollView.delegate = self;
    
    //支持分页，滑动一下直接到下一张图
    self.scrollView.pagingEnabled = YES;
    
    //不现实水平滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //取消末尾的反弹效果
    self.scrollView.bounces = NO;
}

- (void)addImageView {
    for (int i = 0; i < 5; ++i) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width; //屏幕宽度
        CGRect frame = CGRectMake(i * screenWidth, 0, screenWidth, 250);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        NSString *imgName = [NSString stringWithFormat: @"img%d", i];
        imageView.image = [UIImage imageNamed:imgName];
        
        [self.scrollView addSubview:imageView];
        
        //支持滚动范围，纵向不可滚动，设置为0
        self.scrollView.contentSize = CGSizeMake(5 * screenWidth, 0);
    }
}


#pragma mark - UIScrollViewDelegate

//减速结束，对于本案例，用户划一下会调用该函数一次
//使pageControl和scrollView联动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.x; //scrollView当前偏移量
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width; //主屏幕宽度
    
    NSInteger index = offset / screenWidth;
    
    //设置pageControl的索引
    self.pageControl.currentPage = index;
}

@end
